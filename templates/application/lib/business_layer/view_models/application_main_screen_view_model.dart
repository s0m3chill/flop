import 'package:application/business_layer/models/application_model.dart';
import 'package:application/service_layer/main_service/application_main_service.dart';
import 'package:application/service_layer/service_locator.dart';
import 'package:flutter/foundation.dart';

class ApplicationMainScreenViewModel extends ChangeNotifier {
  final ApplicationMainService _mainService = serviceLocator<ApplicationMainService>();

  List<ApplicationModel> _models = [];

  List<ApplicationModel> get getModels {
    return _models;
  }

  void loadData() async {
    await _loadModels();
    _models = await _mainService.getData();
    notifyListeners();
  }

  Future<void> _loadModels() async {
    final data = await _mainService.getData();
    _models = data;
  }
}
