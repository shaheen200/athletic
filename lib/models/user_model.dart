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
        id: '${json['Id']}',
        displayName: '${json['DisplayName']}',
        userName: '${json['UserName']}',
        email: '${json['Email']}',
        phoneNumber: '${json['PhoneNumber']}',
        roles: json['Roles'],
        token: '${json['Token']}',
        refreshToken: '${json['RefreshToken']}',
        userCode: '${json['UserCode']}');
  }
}
