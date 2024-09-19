import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:stream_deck/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Stream Deck Page E2E Test', () {
    testWidgets('Move the volume slider', (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();

      expect(find.byType(Slider), findsOneWidget);
      Slider sliderWidget = widgetTester.widget(find.byType(Slider));
      expect(sliderWidget.value, 0.0);

      await widgetTester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'mac.stream.deck',
        const StandardMethodCodec().encodeMethodCall(
            const MethodCall('changeVolume', '{"result":true}')),
        (ByteData? data) {},
      );

      await widgetTester.drag(find.byType(Slider), const Offset(500.0, 0.0));
      await widgetTester.pumpAndSettle();

      await widgetTester.runAsync(() async {
        await Future.delayed(const Duration(seconds: 1));

        sliderWidget = widgetTester.widget(find.byType(Slider));

        // Verificar se o valor do slider foi atualizado corretamente
        expect(sliderWidget.value, greaterThan(3.0));
      });
    });
  });
}
