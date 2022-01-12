class JanusModel {
  final int id;
  final String description;
  final double price;

  JanusModel(
      {required this.id, required this.description, required this.price});

  factory JanusModel.fromJson(Map<String, dynamic> json) {
    return JanusModel(
        id: json['id'], description: json['description'], price: json['price']);
  }
}
