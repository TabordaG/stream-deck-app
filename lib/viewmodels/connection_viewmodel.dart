import 'dart:io';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

import '../services/services.dart';
import 'stream_deck_viewmodel.dart';

// Include generated file
part 'connection_viewmodel.g.dart';

class ConnectionViewModel = ConnectionViewModelBase with _$ConnectionViewModel;

// The store-class
abstract class ConnectionViewModelBase with Store implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StreamDeckViewModel());
  }

  // -------------------------- Internet Connection --------------------------
  @observable
  WebSocket? channelWebSocket;

  /// The `syncInternetWebSocket` function is an asynchronous action that is responsible for establishing a WebSocket connection.
  ///
  /// It attempts to connect to a WebSocket server using the URL provided by the 'WEBSOCKET_URL' environment variable.
  /// If the connection is successful, it assigns the WebSocket channel to `channelWebSocket`.
  ///
  /// If the connection fails (i.e., `channelWebSocket` is null), it logs an error message and returns.
  ///
  /// If the connection is successful, it sets the ping interval for the WebSocket to 5 seconds. This is to keep the connection alive.
  ///
  /// It then sets up a listener for the WebSocket channel. When data is received, it logs the data, removes the 'echo ' prefix from the data to extract the command, and then executes the command.
  ///
  /// If any exceptions occur during this process, it logs the exception.
  ///
  /// Finally, it sets the loading state to false, indicating that the WebSocket connection process has completed.
  @action
  syncInternetWebSocket({bool hideLoading = false}) async {
    if (!hideLoading) Get.find<StreamDeckViewModel>().setIsLoading(true);

    try {
      channelWebSocket = await WebSocket.connect(
          const String.fromEnvironment('WEBSOCKET_URL'));

      if (channelWebSocket == null) {
        if (!hideLoading) Get.find<StreamDeckViewModel>().setIsLoading(false);
        return;
      }

      channelWebSocket!.pingInterval = const Duration(seconds: 5);

      channelWebSocket!.listen((data) {
        Logger().i(data);

        String command = data.toString().replaceFirst('echo ', '');
        Get.find<StreamDeckViewModel>().executeCommand(command);
      });
    } catch (e) {
      Logger().e(e);
    }

    if (!hideLoading) Get.find<StreamDeckViewModel>().setIsLoading(false);
    return;
  }

  @action
  closeConnection() {
    // Close the WebSocket connection (Internet Connection)
    channelWebSocket?.close();

    // Close the UDP connection (Local Network)
    UdpCommunication.instance.closeSocket();
  }

  /// `sendMessage` is responsible for sending a message over the WebSocket connection.
  ///
  /// It takes a string as an argument, which is the message to be sent.
  ///
  /// If the WebSocket connection is not open or is null, the function attempts to synchronize the WebSocket connection by calling `syncInternetWebSocket`.
  ///
  /// The function then tries to send the message over the `channelWebSocket` WebSocket connection.
  ///
  /// If an error occurs during sending, the function logs the error using the `Logger` class.
  @action
  sendMessage(String msg) async {
    if (channelWebSocket == null ||
        channelWebSocket?.readyState != WebSocket.open) {
      await syncInternetWebSocket(hideLoading: true);
    }

    try {
      channelWebSocket?.add(msg);
    } catch (e) {
      Logger().e(e);
    }
  }
  // ------------------------ Internet Connection END --------------------------

  // ---------------------------- Local Network --------------------------------

  @action
  syncLocalNetworkConnection() {
    UdpCommunication.instance
        .initializeSocket()
        .then((value) => listenForLocalNetworkMessages());
  }

  @action
  listenForLocalNetworkMessages() {
    if (!UdpCommunication.instance.isSocketInitialized) return;

    UdpCommunication.instance.listenForMessages((message) {
      Get.find<StreamDeckViewModel>().executeCommand(message.trim());
    });
  }
}
