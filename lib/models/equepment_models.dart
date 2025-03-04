class EquepmentModels {
  final int id;
  final String name;
  final bool state;
  final String price;

  EquepmentModels(
      {required this.id,
      required this.name,
      required this.state,
      required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'equipmentName': name,
      'isAvailable': state,
      'description': price,
    };
  }

  factory EquepmentModels.fromMap(Map<String, dynamic> map) {
    return EquepmentModels(
      id: map['id'],
      name: map['equipmentName'].toString(),
      state: map['isAvailable'],
      price: map['description'].toString(),
    );
  }

  static List<EquepmentModels> fromListMap(List<dynamic> list) {
    return list.map((map) => EquepmentModels.fromMap(map)).toList();
  }
}
