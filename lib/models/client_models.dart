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
        id: map['id'],
        userId: map['userId'],
        userName: map['userName'],
        userEmail: map['userEmail'],
        phoneNumber: map['phoneNumber'],
        plan: Plan.fromMap(map['plan']),
        startDate: "${map['startDate']}".split('T')[0],
        endDate: "${map['endDate']}".split('T')[0],
        isActive: map['isActive'],
        userCode: map['userCode'] ?? '');
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
      planName: map['planName'],
      durationDays: map['durationDays'],
      price: map['price'],
      id: map['id'],
    );
  }
}
