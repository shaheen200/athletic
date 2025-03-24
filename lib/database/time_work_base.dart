import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:athletic/models/time_work_model.dart';
import 'package:http/http.dart' as http;

class TimeWorkBase {
  static Future<ApiData<TimeWorkModel?>> add(
      {required String dayOfWeek,
      required String startTime,
      required String groupType,
      required String endTime}) async {
    final url = Uri.parse('$domain/api/GymSchedule');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData<TimeWorkModel?>(
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
          "dayOfWeek": dayOfWeek,
          "startTime": startTime,
          "endTime": endTime,
          "groupType": groupType
        }),
      );
      final data = jsonDecode(response.body);
      return ApiData<TimeWorkModel?>(
          success: data['StatusCode'] == 201,
          msg: data['Message'],
          data: TimeWorkModel.fromMap(data['Data']));
    } catch (e) {
      return ApiData<TimeWorkModel?>(
          success: false, msg: "Error: $e", data: null);
    }
  }

  static Future<ApiData<List<TimeWorkModel>>> get() async {
    final url = Uri.parse('$domain/api/GymSchedule');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData<List<TimeWorkModel>>(
          success: false, msg: "سجل الدخول مره اخري", data: []);
    }
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
      );
      final data = jsonDecode(response.body);
      return ApiData<List<TimeWorkModel>>(
          success: data['StatusCode'] == 200,
          msg: data['Message'],
          data: TimeWorkModel.fromMapList(data['Data']));
    } catch (e) {
      return ApiData<List<TimeWorkModel>>(success: false, msg: '$e', data: []);
    }
  }

  static Future<ApiData> updateById({
    required String id,
    required String displayName,
    required String email,
    required int userRole,
    required String gender,
    double? salary,
  }) async {
    final url = Uri.parse('$domain/api/Employee/$id');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData<List<TimeWorkModel>>(
          success: false, msg: "سجل الدخول مره اخري", data: []);
    }

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
        body: jsonEncode({
          'id': id,
          'displayName': displayName,
          'email': email,
          'passWord': null,
          'userRole': userRole,
          'gender': gender,
          'salary': salary,
        }),
      );
      final data = jsonDecode(response.body);
      return ApiData(
          success: data['StatusCode'] == 200, msg: data['Message'], data: []);
    } catch (e) {
      return ApiData(success: false, msg: "Error: $e", data: []);
    }
  }

  static Future<ApiData> delete({
    required String id,
  }) async {
    try {
      final user = await LocalBase.getUserData();
      if (user == null) {
        return const ApiData(
            success: false, msg: "سجل الدخول مره اخري", data: []);
      }
      var response = await http.delete(
        Uri.parse("$domain/api/GymSchedule/$id"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}'
        },
      );
      final data = jsonDecode(response.body);
      return ApiData(
          success: data['StatusCode'] == 200,
          msg: data['Message'],
          data: data['Data']);
    } catch (e) {
      return ApiData(success: false, msg: "$e", data: []);
    }
  }
}
