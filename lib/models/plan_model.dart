class PlanModel {
  final int id;
  String planName;
  double price;
  int durationDays;

  PlanModel({
    required this.id,
    required this.planName,
    required this.price,
    required this.durationDays,
  });

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
        id: map['Id'] ?? 0,
        planName: map['Name'] ?? '',
        durationDays: map['DurationInDays'] ?? 0,
        price: double.parse(map['Price'].toString()));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'planName': planName,
      'durationDays': durationDays,
      'price': price,
    };
  }

  static List<PlanModel> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => PlanModel.fromMap(map)).toList();
  }
}
