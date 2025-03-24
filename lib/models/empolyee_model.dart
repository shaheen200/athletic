class EmployeeModel {
  final String id;
  final String displayName;
  final String email;
  final String? passWord;
  final int userRole;
  final String gender;
  final double? salary;

  EmployeeModel({
    required this.id,
    required this.displayName,
    required this.email,
    this.passWord,
    required this.userRole,
    required this.gender,
    this.salary,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['Id'],
      displayName: json['DisplayName'] ?? '',
      email: json['Email'] ?? '',
      passWord: json['PassWord'] ?? '',
      userRole: json['UserRole'],
      gender: json['Gender'] ?? '',
      salary: json['Salary'] ?? 0.0,
    );
  }

  static List<EmployeeModel> convertListToEmployeeModel(List<dynamic> list) {
    return list.map((map) => EmployeeModel.fromJson(map)).toList();
  }
}
