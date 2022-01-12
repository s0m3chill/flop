import 'package:application/business_layer/view_models/application_main_screen_view_model.dart';
import 'package:get_it/get_it.dart';
import 'main_service/application_main_service.dart';
import 'main_service/application_main_service_implementation.dart';

GetIt serviceLocator = GetIt.instance;

void configureServiceLocator() {
  serviceLocator.registerLazySingleton<ApplicationMainService>(() => ApplicationMainServiceImpl());
  serviceLocator
      .registerFactory<ApplicationMainScreenViewModel>(() => ApplicationMainScreenViewModel());
}
