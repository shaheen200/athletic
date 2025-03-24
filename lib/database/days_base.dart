import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:http/http.dart' as http;

class DaysBase {
  static Future<ApiData> add({
    required String name,
    required String planId,
  }) async {
    final url = Uri.parse('$domain/api/Class');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData(
          success: false, msg: "سجل الدخول مره اخري", data: null);
    }
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
        body: jsonEncode({
          "id": 0,
          'memberName': name,
          'planId': planId,
          "startTime": null,
          "trainerId": null,
        }),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return ApiData(success: true, msg: data['Message'], data: null);
      } else {
        return ApiData(success: false, msg: data['Message'], data: null);
      }
    } catch (e) {
      return ApiData(success: false, msg: "Error: $e", data: null);
    }
  }
}
