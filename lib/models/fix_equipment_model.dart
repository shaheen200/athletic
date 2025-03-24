class FixEquipmentModel {
  final int equipmentId;
  final String description;
  final String time;
  final double cost;

  FixEquipmentModel(
      {required this.equipmentId,
      required this.description,
      required this.cost,
      required this.time});

  factory FixEquipmentModel.fromJson(Map<String, dynamic> json) {
    return FixEquipmentModel(
        equipmentId: json['EquipmentId'],
        description: json['Description'],
        cost: json['Cost'],
        time: json['Time'] ?? '');
  }

  static List<FixEquipmentModel> convertListToModel(List<dynamic> list) {
    return list.map((map) => FixEquipmentModel.fromJson(map)).toList();
  }
}
