import 'package:flutter/foundation.dart';
import 'package:janus/business_layer/models/janus_model.dart';
import 'package:janus/service_layer/main_service/main_service.dart';
import 'package:janus/service_layer/service_locator.dart';

class MainScreenViewModel extends ChangeNotifier {
  final MainService _mainService = serviceLocator<MainService>();

  List<JanusModel> _models = [];

  List<JanusModel> get getModels {
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
