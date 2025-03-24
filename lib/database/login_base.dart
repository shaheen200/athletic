import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:http/http.dart' as http;

class LoginBase {
  static Future<ApiData> login({
    required String email,
    required String pw,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("$domain/api/Account/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": pw}),
      );
      final data = jsonDecode(response.body);
      if (data['StatusCode'] == 200) {
        await LocalBase.saveUserData(data['Data']);
      }
      return ApiData(
          success: data['StatusCode'] == 200, msg: data['Message'], data: []);
    } catch (e) {
      return ApiData(success: false, msg: "$e", data: []);
    }
  }
}
