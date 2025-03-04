class UserModel {
  final String id;
  final String displayName;
  final String userName;
  final String email;
  final String phoneNumber;
  final List<dynamic> roles;
  final String token;
  final String refreshToken;
  final String userCode;

  UserModel({
    required this.id,
    required this.displayName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.roles,
    required this.token,
    required this.refreshToken,
    required this.userCode,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: '${json['id']}',
        displayName: '${json['displayName']}',
        userName: '${json['userName']}',
        email: '${json['email']}',
        phoneNumber: '${json['phoneNumber']}',
        roles: json['roles'],
        token: '${json['token']}',
        refreshToken: '${json['refreshToken']}',
        userCode: '${json['userCode']}');
  }
}
