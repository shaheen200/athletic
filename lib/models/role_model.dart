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
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      isSelected: map['durationDays'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isSelected': isSelected,
    };
  }

  static List<RoleModel> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => RoleModel.fromMap(map)).toList();
  }
}
