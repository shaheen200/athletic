import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:athletic/home/screens/show_member/show.dart';
import 'package:athletic/models/client_models.dart';
import 'package:athletic/models/reco_day_model.dart';
import 'package:http/http.dart' as http;

class MemberBase {
  static Future<ApiData> add({
    required String name,
    required String planId,
    required String email,
    required String phone,
  }) async {
    final url = Uri.parse('$domain/api/Membership');
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
          "userName": name,
          "userEmail": email,
          "phoneNumber": phone,
          "planId": planId,
          "startDate": DateTime.now().toString().split(' ')[0],
          "isActive": true
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

  static Future<ApiData<ClientModels?>> update(
      {required String name,
      required String email,
      required String phone,
      required int id}) async {
    final url = Uri.parse('$domain/api/Membership/$id');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData(
          success: false, msg: "سجل الدخول مره اخري", data: null);
    }
    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
        body: jsonEncode(
            {"userName": name, "userEmail": email, "phoneNumber": phone}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiData<ClientModels?>(
            success: true,
            msg: data['Message'] ?? '',
            data: ClientModels.fromMap(data['Data']));
      } else {
        return ApiData<ClientModels?>(
            success: false, msg: data['Message'], data: null);
      }
    } catch (e) {
      return ApiData<ClientModels?>(
          success: false, msg: "Error: $e", data: null);
    }
  }

  static Future<ApiData<List<ClientModels>>> get({
    required ShowMemeberState state,
  }) async {
    final url = Uri.parse(state == ShowMemeberState.active
        ? '$domain/api/Membership/active'
        : '$domain/api/Membership/suspended');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData(
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
      if (response.statusCode == 200) {
        return ApiData<List<ClientModels>>(
            success: true,
            msg: data['Message'],
            data: ClientModels.convertToModelList(data['Data']));
      } else {
        return ApiData<List<ClientModels>>(
            success: false, msg: data['Message'], data: []);
      }
    } catch (e) {
      return ApiData<List<ClientModels>>(
          success: false, msg: "Error: $e", data: []);
    }
  }

  static Future<ApiData> recoDay({required String userCode}) async {
    final url = Uri.parse('$domain/api/Attendance');
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
        body: jsonEncode({"userCode": userCode}),
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

  static Future<ApiData<List<RecoDayModel>>> getRecoDay(
      {required String userCode}) async {
    final url =
        Uri.parse('$domain/api/Attendance/getattendances?userCode=$userCode');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData(
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
      if (response.statusCode == 200) {
        return ApiData<List<RecoDayModel>>(
            success: true,
            msg: data['Message'],
            data: RecoDayModel.fromListDynamic(data['Data']));
      } else {
        return ApiData<List<RecoDayModel>>(
            success: false, msg: data['Message'], data: []);
      }
    } catch (e) {
      return ApiData<List<RecoDayModel>>(
          success: false, msg: "Error: $e", data: []);
    }
  }

  static Future<ApiData> renew(
      {required int membershipId, required String planId}) async {
    final url = Uri.parse('$domain/api/Membership/renew');
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
        body: jsonEncode({"membershipId": membershipId, "planId": planId}),
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
