class EquepmentModels {
  final int id;
  final String name;
  final bool state;
  final double price;

  EquepmentModels(
      {required this.id,
      required this.name,
      required this.state,
      required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'state': state,
      'price': price,
    };
  }

  factory EquepmentModels.fromMap(Map<String, dynamic> map) {
    return EquepmentModels(
      id: map['id'],
      name: map['name'],
      state: map['state'],
      price: map['price'],
    );
  }

  static List<EquepmentModels> fromListMap(List<Map<String, dynamic>> list) {
    return list.map((map) => EquepmentModels.fromMap(map)).toList();
  }
}
