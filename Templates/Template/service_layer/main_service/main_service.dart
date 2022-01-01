import 'package:template/business_layer/models/template_model.dart';

abstract class MainService {
  Future addData(List<TemplateModel> data);

  Future<List<TemplateModel>> getData();
}
