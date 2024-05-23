import 'dart:io';

import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../models/models.dart';

// Include generated file
part 'stream_deck_viewmodel.g.dart';

class StreamDeckViewModel = StreamDeckViewModelBase with _$StreamDeckViewModel;

// The store-class
abstract class StreamDeckViewModelBase with Store {
  @observable
  bool isLoading = true;

  @observable
  double sliderValue = 0.0;

  @observable
  List<String> musicActions = [
    'previous track',
    'playpause',
    'playpause',
    'stop',
    'next track',
  ];

  @observable
  MethodChannel flutterChannel = const MethodChannel('mac.stream.deck');

  @action
  setIsLoading(bool value) => isLoading = value;

  @action
  setSliderValue(double value) => sliderValue = value;

  /// The `executeCommand` function is responsible for executing a given command.
  ///
  /// It takes a string as an argument, which represents the command to be executed.
  ///
  /// The function parses the command and determines the appropriate action to take based on the command's value.
  ///
  /// For example, if the command is 'OPEN', it may trigger a function to display a particular APP on the device.
  ///
  /// If the command is not recognized, the function may log an error message or throw an exception.
  ///
  /// This function is typically called when a command is received from the WebSocket connection.
  @action
  executeCommand(String command) {
    if (double.tryParse(command) != null) {
      setSliderValue(double.parse(command));

      /// If your device is not a Macbook, you can just run the Slider Widget tweak for now
      if (!Platform.isMacOS) return;

      changeVolume(double.parse(command));
      return;
    }

    if (!Platform.isMacOS) return;

    if (appNameList.contains(command)) {
      openApp(command);
      return;
    }

    if (musicActions.contains(command)) {
      changeMusic(command);
      return;
    }

    playSoundsEffects(command);
  }

  /// `openApp` launches a specified application.
  @action
  Future<void> openApp(String name) async {
    final arguments = {'name': name};
    await flutterChannel.invokeMethod('openApp', arguments);
    Logger().d(flutterChannel.toString());
  }

  /// `changeVolume` adjusts the volume of the application's audio output.
  @action
  Future<void> changeVolume(double value) async {
    final arguments = {'value': value.toInt()};
    await flutterChannel.invokeMethod('changeVolume', arguments);
  }

  /// `changeMusic` switches the currently playing music track.
  @action
  Future<void> changeMusic(String action) async {
    final arguments = {'action': action};
    await flutterChannel.invokeMethod('changeMusic', arguments);
  }

  /// `playSoundEffects` triggers a specific sound effect to play.
  @action
  Future<void> playSoundsEffects(String name) async {
    final arguments = {'sounds_effect': name};
    await flutterChannel.invokeMethod('soundsEffect', arguments);
  }
}
