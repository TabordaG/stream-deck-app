import Cocoa
import FlutterMacOS
import IOKit
import Foundation
import AVFoundation

class MainFlutterWindow: NSWindow, AVAudioPlayerDelegate {
  var audioPlayer: AVAudioPlayer?

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
      
      // TODO:[Mac][1] Set the flutter channel
      let flutterChannel = FlutterMethodChannel(name: "mac.stream.deck",
              binaryMessenger: flutterViewController.engine.binaryMessenger)

      // TODO:[Mac][2] Set the channel method call handler
      flutterChannel.setMethodCallHandler({
          (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in

          switch call.method {
            case "openApp":
              guard let args = call.arguments as? [String: String] else {return}
              let name = args["name"]!
              print(name)
              
              print("open -a \"\(name)\"")
              self.shell("open -a \"\(name)\"", false)
              result(100)

            case "changeVolume":
              guard let args = call.arguments as? [String: Int] else {return}
              let value = args["value"]!
              print(value)
                
              let script = "osascript -e \"set Volume \(value)\""
              print(script)
              self.shell(script, false)
              result(100)

            case "soundsEffect":
              guard let args = call.arguments as? [String: String] else {return}
              let value = args["sounds_effect"]!
                
              self.playAudio(value)
              result(100)

            case "changeMusic":
              guard let args = call.arguments as? [String: String] else {return}
              let action = args["action"]!
              print(action)
              
              let script = "osascript -e \'tell application \"Spotify\" to \(action)\'"
              self.shell(script, false)
              result(100)

            default:
              result(FlutterMethodNotImplemented)
          }
      })

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }

    func runAppleScript(_ command: String) {
      let script = """
      tell application "System Events"
          if (count of (every process whose name is "Spotify")) > 0 then
              tell application "Spotify" to playpause
          else
              display dialog "Spotify is not running."
          end if
      end tell
      """

      var error: NSDictionary?
      if let scriptObject = NSAppleScript(source: script) {
          let output = scriptObject.executeAndReturnError(&error)
          if let error = error {
              print("Error: \(error)")
          } else {
              print("Output: \(output.stringValue ?? "No output")")
          }
      }
    }
    
    @discardableResult
    func shell(_ command: String, _ isSudo: Bool) -> String {
        let task = Process()
        let pipe = Pipe()
        let password = "231119"
        
        task.standardOutput = pipe
        task.standardError = pipe
        if(isSudo) {
            task.arguments = ["-c", "echo '\(password)' | sudo -S \(command)"]
        } else {
            task.arguments = ["-c", command]
        }
        task.launchPath = "/bin/zsh"
        task.standardInput = nil
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        print(output)
        return output
    }

    // @discardableResult
    // func playAudioFile(_ fileName: String, _ isSudo: Bool) -> String {
    //   let task = Process()
    //   let pipe = Pipe()
    //   let password = "your_password"  // Substitua pelo seu sudo password se necessário

    //   task.standardOutput = pipe
    //   task.standardError = pipe

    //   let script = """
    //   set audioFileName to "\(fileName)"
    //   set audioFilePath to "/Users/gabrielmoreira/Downloads/" & audioFileName

    //   try
    //       set audioFile to POSIX file audioFilePath
    //       do shell script "open -a 'QuickTime Player' " & quoted form of POSIX path of audioFile
    //       delay 2
    //       tell application "System Events" to activate
    //       tell application "System Events"
    //         if (name of processes) contains "QuickTime Player" then
    //             key code 49  -- press spacebar to play
    //         else
    //             display dialog "QuickTime Player is not running."
    //         end if
    //       end tell
    //   on error errMsg
    //       display dialog errMsg
    //   end try
    //   """

    //   let userHome = FileManager.default.homeDirectoryForCurrentUser
    //   let scriptFilePath = userHome.appendingPathComponent("audio_script.scpt").path

    //   do {
    //       try script.write(toFile: scriptFilePath, atomically: true, encoding: .utf8)
    //   } catch {
    //       print("Error writing AppleScript to file: \(error)")
    //       return ""
    //   }

    //   if isSudo {
    //       task.arguments = ["-c", "echo '\(password)' | sudo -S osascript \(scriptFilePath)"]
    //   } else {
    //       task.arguments = ["-c", "osascript \(scriptFilePath)"]
    //   }

    //   task.launchPath = "/bin/zsh"
    //   task.standardInput = nil

    //   task.launch()

    //   let data = pipe.fileHandleForReading.readDataToEndOfFile()
    //   let output = String(data: data, encoding: .utf8)!
    //   print(output)

    //   return output
    // }

    func playAudio(_ name: String) {
        // Caminho para o arquivo de áudio no seu projeto
        if let path = Bundle.main.path(forResource: "songs/" + name, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)

            do {
                // Se o áudio estiver sendo reproduzido, pare
                if let player = audioPlayer, player.isPlaying {
                    player.stop()
                } else {
                    // Caso contrário, inicialize o AVAudioPlayer
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.delegate = nil  // Defina a delegate para receber notificações
                    audioPlayer?.prepareToPlay()
                    audioPlayer?.play()

                    // Adicione uma notificação para detectar o término da reprodução
                    NotificationCenter.default.addObserver(self,
                                                       selector: #selector(audioPlayerDidFinishPlaying(_:)),
                                                       name: .AVPlayerItemDidPlayToEndTime,
                                                       object: audioPlayer)

                    print("Iniciando áudio")
                }
            } catch {
                // Trate qualquer erro ao inicializar o AVAudioPlayer
                print("Erro ao inicializar AVAudioPlayer: \(error.localizedDescription)")
            }
        } else {
            print("Arquivo de áudio não encontrado.")
        }
    }

     @objc func audioPlayerDidFinishPlaying(_ notification: Notification) {
        // Chamado quando a reprodução do áudio é concluída
        print("Áudio terminado de tocar")

        // Remova a notificação
        NotificationCenter.default.removeObserver(self,
                                                  name: .AVPlayerItemDidPlayToEndTime,
                                                  object: audioPlayer)
    }
}
