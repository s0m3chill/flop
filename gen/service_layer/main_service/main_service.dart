import 'package:janus/business_layer/models/janus_model.dart';

abstract class MainService {
  Future addData(List<JanusModel> data);

  Future<List<JanusModel>> getData();
}
