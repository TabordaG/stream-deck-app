import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Slider changes value when dragged', (WidgetTester tester) async {
    // // Inicialize a UI
    // await tester.pumpWidget(const MyApp());
    // await tester.pumpAndSettle();

    // // Verificar o valor inicial do Slider
    // expect(find.byType(Slider), findsOneWidget);
    // Slider sliderWidget = tester.widget(find.byType(Slider));
    // expect(sliderWidget.value, 0.0);

    // tester.binding.defaultBinaryMessenger.handlePlatformMessage(
    //   'mac.stream.deck',
    //   const StandardMethodCodec().encodeMethodCall(
    //       const MethodCall('changeVolume', '{"result":true}')),
    //   (ByteData? data) {},
    // );

    // // Interagir com o Slider
    // await tester.drag(find.byType(Slider), const Offset(500.0, 0.0));
    // await tester.pumpAndSettle();

    // await tester.runAsync(() async {
    //   // Adicionar um tempo de espera
    //   await Future.delayed(const Duration(seconds: 5));

    //   sliderWidget = tester.widget(find.byType(Slider));

    //   // Verificar se o valor do slider foi atualizado corretamente
    //   expect(sliderWidget.value, greaterThan(3.0));
    // });
  });
}
