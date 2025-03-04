import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/models/client_models.dart';
import 'package:http/http.dart' as http;

class ClientBase {
  static Future<void> updateMemberShip() async {
    final url = Uri.parse('$domain/api/Membership/5');
    const token = '<token>';

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'id': 5,
          'userId': '2b098674-b51c-43d6-83ff-2a5c6b9b7bd5',
          'userName': 'medohathout',
          'userEmail': 'medohathout55@gmail.com',
          'classId': 5,
          'className': 'fit',
          'planId': 1,
          'planName': 'حصه حديد',
          'startDate': '2025-03-01T01:20:05.665',
          'endDate': '2025-03-01T01:20:05.665',
          'isActive': false,
        }),
      );

      if (response.statusCode == 200) {
        print('Membership updated successfully');
      } else {
        print('Failed to update membership: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  static Future<ApiData<List<ClientModels>>> getAllMemberShip() async {
    final url = Uri.parse('$domain/api/Membership/1');
    const token = '<token>';

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = response.body;
        print(data);
        return const ApiData<List<ClientModels>>(
            success: true, msg: "data[]", data: []);
      } else {
        print('Failed to add plan: ${response.statusCode}');
        return const ApiData<List<ClientModels>>(
            success: false, msg: "data[]", data: []);
      }
    } catch (e) {
      print(e);
      return ApiData<List<ClientModels>>(success: false, msg: "$e", data: []);
    }
  }

  static Future<ApiData> addMemberShip({
    required int id,
    required String userId,
    required String userName,
    required String userEmail,
    required int classId,
    required String className,
    required int planId,
    required String planName,
    required String startDate,
    required String endDate,
    required bool isActive,
  }) async {
    final url = Uri.parse('$domain/api/Membership');
    const token = '<token>';

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'id': id,
          'userId': userId,
          'userName': userName,
          'userEmail': userEmail,
          'classId': classId,
          'className': className,
          'planId': planId,
          'planName': planName,
          'startDate': startDate,
          'endDate': endDate,
          'isActive': isActive,
        }),
      );

      if (response.statusCode == 200) {
        final data = response.body;
        print(data);
        return ApiData(success: true, msg: "Data successfully added", data: []);
      } else {
        print('Failed to add plan: ${response.statusCode}');
        return ApiData(success: false, msg: "Failed to add plan", data: []);
      }
    } catch (e) {
      print(e);
      return ApiData(success: false, msg: "Error: $e", data: []);
    }
  }

  static Future<void> getAllRoles() async {
    final url = Uri.parse('$domain/api/Role');
    const token = '<token>';

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final roles = jsonDecode(response.body);
        print('Roles retrieved successfully: $roles');
      } else {
        print('Failed to retrieve roles: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
