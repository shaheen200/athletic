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
      id: json['id'],
      displayName: json['displayName'],
      email: json['email'],
      passWord: json['passWord'],
      userRole: json['userRole'],
      gender: json['gender'],
      salary: json['salary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'passWord': passWord,
      'userRole': userRole,
      'gender': gender,
      'salary': salary,
    };
  }

  static List<EmployeeModel> convertListToEmployeeModel(List<dynamic> list) {
    return list.map((map) => EmployeeModel.fromJson(map)).toList();
  }
}
