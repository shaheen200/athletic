import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:athletic/models/close_day_model.dart';
import 'package:http/http.dart' as http;

class CloseDayBase {
  static Future<ApiData<CloseDayModel?>> get({
    required String startDate,
    required String endDate,
  }) async {
    final url = Uri.parse('$domain/api/FinancialTransaction/close-drawer');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData<CloseDayModel?>(
          success: false, msg: "سجل الدخول مره اخري", data: null);
    }
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
        body: jsonEncode({"startDate": startDate, "endDate": endDate}),
      );
      final data = jsonDecode(response.body);
      if (data['StatusCode'] == 200) {
        return ApiData<CloseDayModel?>(
            success: true,
            msg: data['Message'],
            data: CloseDayModel.fromMap(data['Data']));
      } else {
        return ApiData<CloseDayModel?>(
            success: false, msg: data['Message'], data: null);
      }
    } catch (e) {
      return ApiData<CloseDayModel?>(
          success: false, msg: "Error: $e", data: null);
    }
  }
}
