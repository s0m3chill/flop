class TemplateModel {
  final int id;
  final String description;
  final double price;

  TemplateModel(
      {required this.id, required this.description, required this.price});

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(
        id: json['id'], description: json['description'], price: json['price']);
  }
}
