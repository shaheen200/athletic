class ClientModels {
  final int id;
  final String userId;
  final String userName;
  final String userEmail;
  final String phoneNumber;
  final Plan plan;
  final String startDate;
  final String endDate;
  final bool isActive;
  final String userCode;

  ClientModels(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.userEmail,
      required this.phoneNumber,
      required this.plan,
      required this.startDate,
      required this.endDate,
      required this.isActive,
      required this.userCode});

  factory ClientModels.fromMap(Map<String, dynamic> map) {
    return ClientModels(
        id: map['Id'],
        userId: map['UserId'],
        userName: map['UserName'],
        userEmail: map['UserEmail'],
        phoneNumber: map['PhoneNumber'],
        plan: Plan.fromMap(map['Plan']),
        startDate: "${map['StartDate']}".split('T')[0],
        endDate: "${map['EndDate']}".split('T')[0],
        isActive: map['IsActive'],
        userCode: map['UserCode'] ?? '');
  }
  static List<ClientModels> convertToModelList(List<dynamic> maps) {
    return maps.map((map) => ClientModels.fromMap(map)).toList();
  }
}

class Plan {
  final String planName;
  final int durationDays;
  final double price;
  final int id;

  Plan({
    required this.planName,
    required this.durationDays,
    required this.price,
    required this.id,
  });

  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      planName: map['PlanName'],
      durationDays: map['DurationDays'],
      price: map['Price'],
      id: map['Id'],
    );
  }
}
