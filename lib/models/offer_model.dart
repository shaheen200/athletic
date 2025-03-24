class OfferModel {
  final int id;
  final int planId;
  final String planName;
  final double originalPrice;
  final double discountedPrice;
  final String startDate;
  final String endDate;
  final bool isActive;

  // Constructor
  OfferModel({
    required this.id,
    required this.planId,
    required this.planName,
    required this.originalPrice,
    required this.discountedPrice,
    required this.startDate,
    required this.endDate,
    required this.isActive,
  });

  // Factory to create a Plan object from a map
  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      id: map['Id'],
      planId: map['PlanId'],
      planName: map['PlanName'],
      originalPrice: map['OriginalPrice'],
      discountedPrice: map['DiscountedPrice'],
      startDate: map['StartDate'].toString().split('T')[0],
      endDate: map['EndDate'].toString().split('T')[0],
      isActive: map['IsActive'],
    );
  }

  // Method to convert a Plan object to a map
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'PlanId': planId,
      'PlanName': planName,
      'OriginalPrice': originalPrice,
      'DiscountedPrice': discountedPrice,
      'StartDate': startDate,
      'EndDate': endDate,
      'IsActive': isActive,
    };
  }

  // Method to convert a list of maps to a list of Plan objects
  static List<OfferModel> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => OfferModel.fromMap(map)).toList();
  }
}
