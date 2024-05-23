import 'package:get_it/get_it.dart';

import '../viewmodels/viewmodels.dart';

final sl = GetIt.I;

Future<void> initInject() async {
  sl.registerLazySingleton<ConnectionViewModel>(() => ConnectionViewModel());
  sl.registerLazySingleton<StreamDeckViewModel>(() => StreamDeckViewModel());
}
