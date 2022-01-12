import 'package:get_it/get_it.dart';
import 'package:janus/business_layer/view_models/main_screen_view_model.dart';

import 'main_service/main_service.dart';
import 'main_service/main_service_implementation.dart';

GetIt serviceLocator = GetIt.instance;

void configureServiceLocator() {
  serviceLocator.registerLazySingleton<MainService>(() => MainServiceImpl());
  serviceLocator
      .registerFactory<MainScreenViewModel>(() => MainScreenViewModel());
}
