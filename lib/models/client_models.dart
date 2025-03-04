class ClientModels {
  final String id;
  String name;
  String phone;
  String type;
  String come;
  String out;
  String time;
  bool isActive;
  String by;
  double salary;
  String jobId;
  String jobName;
  String byName; // Added field

  ClientModels({
    required this.id,
    required this.name,
    required this.phone,
    required this.type,
    required this.come,
    required this.out,
    required this.time,
    required this.isActive,
    required this.by,
    required this.salary,
    required this.jobId,
    required this.jobName,
    required this.byName, // Added field
  });

  factory ClientModels.fromMap(Map<String, dynamic> map) {
    return ClientModels(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      type: map['type'] ?? '',
      come: map['come'] ?? '',
      out: map['out'] ?? '',
      jobName: map['job_name'] ?? '',
      time: map['time'] ?? '',
      isActive: map['is_active'] as bool,
      by: map['by'] ?? '',
      salary: map['salary'] as double,
      jobId: map['job_id'] ?? '',
      byName: map['by_name'] ?? '', // Added field
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'type': type,
      'come': come,
      'out': out,
      'job_name': jobName,
      'time': time,
      'is_active': isActive,
      'by': by,
      'salary': salary,
      'job_id': jobId,
      'by_name': byName, // Added field
    };
  }

  static List<ClientModels> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => ClientModels.fromMap(map)).toList();
  }
}
