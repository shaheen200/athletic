import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:http/http.dart' as http;

class MeBase {
  static Future<ApiData> changePw({
    required String oldPw,
    required String newPw,
  }) async {
    try {
      final user = await LocalBase.getUserData();
      var response = await http.post(
        Uri.parse("$domain/api/Account/change-password"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user?.token}',
        },
        body: jsonEncode({"oldPassword": oldPw, "newPassword": newPw}),
      );
      final data = jsonDecode(response.body);
      return ApiData(
          success: data['StatusCode'] == 200, msg: data['Message'], data: []);
    } catch (e) {
      return ApiData(success: false, msg: "$e", data: []);
    }
  }

  static Future<ApiData> editData({
    required String oldPw,
    required String newPw,
    required String userId,
  }) async {
    try {
      final user = await LocalBase.getUserData();
      var response = await http.post(
        Uri.parse("$domain/api/User/users/$userId"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user?.token}',
        },
        body: jsonEncode({"oldPassword": oldPw, "newPassword": newPw}),
      );
      final data = jsonDecode(response.body);
      return ApiData(
          success: data['StatusCode'] == 200, msg: data['Message'], data: []);
    } catch (e) {
      return ApiData(success: false, msg: "$e", data: []);
    }
  }

  static Future<ApiData<Map<String, dynamic>>> getData() async {
    try {
      final user = await LocalBase.getUserData();
      var response = await http.get(
        Uri.parse("$domain/api/User/users/${user!.id}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
      );
      final data = jsonDecode(response.body);
      return ApiData<Map<String, dynamic>>(
          success: data['StatusCode'] == 200,
          msg: data['Message'],
          data: data['Data']);
    } catch (e) {
      return ApiData<Map<String, dynamic>>(success: false, msg: "$e", data: {});
    }
  }
}
