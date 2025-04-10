class PlanModel {
  final int id;
  String planName;
  double price;
  int durationDays;
  double? discountedPrice;
  bool hasOffer;

  PlanModel(
      {required this.id,
      required this.planName,
      required this.price,
      required this.durationDays,
      required this.hasOffer,
      required this.discountedPrice});

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    return PlanModel(
        id: map['Id'] ?? 0,
        hasOffer: map['HasOffer'] ?? false,
        planName: map['Name'] ?? map['PlanName'] ?? '',
        durationDays: map['DurationInDays'] ?? map['DurationDays'] ?? 0,
        discountedPrice: map['DiscountedPrice'],
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
