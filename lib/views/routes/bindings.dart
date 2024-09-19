import 'package:get/get.dart';
import 'package:stream_deck/viewmodels/viewmodels.dart';

class StreamDeckBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectionViewModel());
    Get.lazyPut(() => StreamDeckViewModel());
  }
}
