import 'package:application/business_layer/models/application_model.dart';

abstract class ApplicationMainService {
  Future addData(List<ApplicationModel> data);

  Future<List<ApplicationModel>> getData();
}
