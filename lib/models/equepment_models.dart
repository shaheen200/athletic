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

  factory EquepmentModels.fromMap(Map<String, dynamic> map) {
    return EquepmentModels(
      id: map['Id'],
      name: map['EquipmentName'].toString(),
      state: map['IsAvailable'],
      price: map['Description'].toString(),
    );
  }

  static List<EquepmentModels> fromListMap(List<dynamic> list) {
    return list.map((map) => EquepmentModels.fromMap(map)).toList();
  }
}
