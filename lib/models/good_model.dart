class GoodModel {
  final int id;
  final String name;
  final double price;
  final int count;
  final bool isActive;

  GoodModel({
    required this.id,
    required this.name,
    required this.price,
    required this.count,
    required this.isActive,
  });

  // Factory constructor to create a GoodModel object from a Map
  factory GoodModel.fromJson(Map<String, dynamic> json) {
    return GoodModel(
      id: json['Id'],
      name: json['Name'].toString(),
      price: json['Price'] ?? 0.0,
      count: json['Count'] ?? 0,
      isActive: json['IsAvailable'] ?? false,
    );
  }

  // Method to convert a list of maps to a list of GoodModel objects
  static List<GoodModel> convertListToModel(List<dynamic> list) {
    return list.map((map) {
      return GoodModel.fromJson(map);
    }).toList();
  }
}
