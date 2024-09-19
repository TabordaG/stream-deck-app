import 'package:flutter_test/flutter_test.dart';
import 'dart:io';

import 'package:stream_deck/viewmodels/viewmodels.dart';

void main() {
  group('ConnectionViewModel', () {
    late ConnectionViewModel connectionViewModel;

    setUp(() {
      connectionViewModel = ConnectionViewModel();
      connectionViewModel.dependencies();
    });

    test('should set WebSocket channel when syncWebSocket is called', () async {
      await connectionViewModel.syncInternetWebSocket();
      expect(connectionViewModel.channelWebSocket, isNotNull);
    });

    test('close connections', () {
      connectionViewModel.closeConnection();
      expect(connectionViewModel.channelWebSocket?.readyState != WebSocket.open,
          true);
    });
    // Add more tests as needed
  });
}
