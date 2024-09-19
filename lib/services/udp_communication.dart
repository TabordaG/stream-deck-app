import 'dart:io';

import 'package:logger/logger.dart';

class UdpCommunication {
  static const multicastAddress = '224.0.0.1'; // default multicast address
  RawDatagramSocket? _udpSocket;
  UdpCommunication._privateConstructor();

  static final UdpCommunication instance =
      UdpCommunication._privateConstructor();

  Future<void> initializeSocket({String? host, int? port}) async {
    try {
      // _udpSocket = await RawDatagramSocket.bind('127.0.0.1', 12345);
      _udpSocket = await RawDatagramSocket.bind(
          host ?? InternetAddress.anyIPv4, port ?? 12345,
          reuseAddress: true);
      if (_udpSocket == null) {
        Logger().e('Unable to bind to socket');
        return;
      }

      _udpSocket?.joinMulticast(InternetAddress(multicastAddress));
      Logger().i(
          'Socket bound to ${_udpSocket?.address.address}:${_udpSocket?.port}');
    } on SocketException catch (socketException) {
      Logger().e(socketException);
      if (socketException.osError?.message == 'Address already in use') {
        Logger().i('Address already in use, trying to close the socket');
      }
    } catch (e) {
      Logger().e(e);
    }

    return;
  }

  bool get isSocketInitialized => _udpSocket != null;

  void closeSocket() {
    _udpSocket?.close();
  }

  void sendMessage(String message, InternetAddress address, int port) {
    if (_udpSocket == null) return;
    // _udpSocket?.send(message.codeUnits, address, port);
    _udpSocket?.send(
        message.codeUnits, InternetAddress(multicastAddress), 12345);
  }

  void listenForMessages(Function(String) onMessageReceived) {
    if (_udpSocket == null) return;
    _udpSocket?.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        Datagram? datagram = _udpSocket?.receive();
        if (datagram != null) {
          String message = String.fromCharCodes(datagram.data);
          onMessageReceived(message);
        }
      }
    });
  }
}
