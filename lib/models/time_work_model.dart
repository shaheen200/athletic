class TimeWorkModel {
  final int id;
  final String dayOfWeek;
  final String startTime;
  final String endTime;
  final String groupType;
  final bool isActive;

  // Constructor
  TimeWorkModel({
    required this.id,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.groupType,
    required this.isActive,
  });

  // Factory method to create a TimeWorkModel object from a map
  factory TimeWorkModel.fromMap(Map<String, dynamic> map) {
    return TimeWorkModel(
      id: map['Id'],
      dayOfWeek: map['DayOfWeek'],
      startTime: map['StartTime'],
      endTime: map['EndTime'],
      groupType: map['GroupType'],
      isActive: map['IsActive'],
    );
  }

  // Method to convert a TimeWorkModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'DayOfWeek': dayOfWeek,
      'StartTime': startTime,
      'EndTime': endTime,
      'GroupType': groupType,
      'IsActive': isActive,
    };
  }

  static List<TimeWorkModel> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => TimeWorkModel.fromMap(map)).toList();
  }
}
