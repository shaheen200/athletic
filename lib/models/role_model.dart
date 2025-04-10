class RoleModel {
  final String id;
  String name;

  RoleModel({
    required this.id,
    required this.name,
  });

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      id: map['Id'] ?? '',
      name: map['Name'] ?? '',
    );
  }

  static List<RoleModel> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => RoleModel.fromMap(map)).toList();
  }
}
