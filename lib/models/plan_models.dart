class PlanModels {
  final int id;
  final String name;
  final int countDay;
  final double price;

  PlanModels(
      {required this.id,
      required this.name,
      required this.countDay,
      required this.price});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'countDay': countDay,
      'price': price,
    };
  }

  factory PlanModels.fromMap(Map<String, dynamic> map) {
    return PlanModels(
      id: map['id'],
      name: map['name'],
      countDay: map['countDay'],
      price: map['price'],
    );
  }

  static List<PlanModels> fromListMap(List<Map<String, dynamic>> list) {
    return list.map((map) => PlanModels.fromMap(map)).toList();
  }
}
