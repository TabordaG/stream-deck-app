import 'package:flutter_mac_stream_deck/models/app_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check apps list', () {
    expect(appNameList.length, equals(appList.length));
  });
}
