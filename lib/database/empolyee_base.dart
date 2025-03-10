import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:athletic/method/get_id.dart';
import 'package:athletic/models/empolyee_model.dart';
import 'package:athletic/models/role_model.dart';
import 'package:http/http.dart' as http;

class EmpolyeeBase {
  static Future<ApiData> addUsers({
    required String displayName,
    required String email,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
    required String gender,
    required String salary,
    required int userRole,
  }) async {
    final url = Uri.parse('$domain/api/Employee');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData(
          success: false, msg: "سجل الدخول مره اخري", data: []);
    }
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
        body: jsonEncode({
          "id": getId(),
          "displayName": displayName,
          "email": email,
          "userRole": userRole,
          "gender": gender,
          "salary": salary,
          "passWord": password,
          "confirmPassword": password,
        }),
      );
      final data = jsonDecode(response.body);
      return ApiData(
          success: data['statusCode'] == 201, msg: data['message'], data: []);
    } catch (e) {
      return ApiData(success: false, msg: "Error: $e", data: []);
    }
  }

  static Future<ApiData<List<RoleModel>>> getAllRoles() async {
    final url = Uri.parse('$domain/api/Role');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData<List<RoleModel>>(
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

      final roles = jsonDecode(response.body);
      return ApiData<List<RoleModel>>(
          success: roles['statusCode'] == 200,
          msg: roles['message'],
          data: RoleModel.fromMapList(roles['data'])
              .where(
                (element) => element.id != '3',
              )
              .toList());
    } catch (e) {
      return ApiData<List<RoleModel>>(success: false, msg: '$e', data: []);
    }
  }

  static Future<ApiData<List<EmployeeModel>>> getAllEmp() async {
    final url = Uri.parse('$domain/api/Employee');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData<List<EmployeeModel>>(
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

      final emp = jsonDecode(response.body);
      return ApiData<List<EmployeeModel>>(
          success: emp['statusCode'] == 200,
          msg: emp['message'],
          data: EmployeeModel.convertListToEmployeeModel(emp['data']['items']));
    } catch (e) {
      return ApiData<List<EmployeeModel>>(success: false, msg: '$e', data: []);
    }
  }

  static Future<ApiData> updateEmployeeById({
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
      return const ApiData<List<EmployeeModel>>(
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
          success: data['statusCode'] == 200, msg: data['message'], data: []);
    } catch (e) {
      return ApiData(success: false, msg: "Error: $e", data: []);
    }
  }
}
