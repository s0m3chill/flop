import 'package:application/business_layer/models/application_model.dart';
import 'package:test/test.dart';

void main() {
  group('Testing application model class', () {
    var configModel = ApplicationModel();

    test('A new application config should be added', () {
      var configNo = 5;
      configModel.add(configNo);
      expect(configModel.items.contains(configNo), true);
    });

    test('Application config should be removed', () {
      var configNo = 8;
      configModel.add(configNo);
      expect(configModel.items.contains(configNo), true);
      configModel.remove(configNo);
      expect(configModel.items.contains(configNo), false);
    });
  });
}
