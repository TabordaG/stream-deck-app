import 'package:flutter_test/flutter_test.dart';
import 'package:stream_deck/models/models.dart';

void main() {
  test('Check apps list', () {
    expect(appNameList.length, equals(appList.length));
  });
}
