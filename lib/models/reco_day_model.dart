class RecoDayModel {
  final int id;
  final String userCode;
  final String attendanceDate;

  RecoDayModel({
    required this.id,
    required this.userCode,
    required this.attendanceDate,
  });

  // Factory method to create a RecoDayModel instance from a map
  factory RecoDayModel.fromMap(Map<String, dynamic> map) {
    return RecoDayModel(
      id: map['id'] as int,
      userCode: map['userCode'].toString(),
      attendanceDate: map['attendanceDate'].toString(),
    );
  }

  // Static method to convert a list of dynamic to a list of RecoDayModel
  static List<RecoDayModel> fromListDynamic(List<dynamic> list) {
    return list
        .map((item) => RecoDayModel.fromMap(item as Map<String, dynamic>))
        .toList();
  }
}
