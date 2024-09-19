import 'package:get/get.dart';

import 'bindings.dart';
import '/views/stream_deck_view.dart';

appRoutes() => [
      GetPage(
        name: '/home',
        page: () => const StreamDeckView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
        binding: StreamDeckBinding(),
      ),
    ];
