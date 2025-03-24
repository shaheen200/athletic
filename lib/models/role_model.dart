class RoleModel {
  final String id;
  String name;
  bool isSelected;

  RoleModel({
    required this.id,
    required this.name,
    required this.isSelected,
  });

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      id: map['Id'] ?? '',
      name: map['Name'] ?? '',
      isSelected: map['DurationDays'] ?? false,
    );
  }

  static List<RoleModel> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => RoleModel.fromMap(map)).toList();
  }
}
