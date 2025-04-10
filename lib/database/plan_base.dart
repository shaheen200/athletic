import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:athletic/models/plan_model.dart';
import 'package:http/http.dart' as http;

class PlanBase {
  static Future<ApiData> add({
    required String planName,
    required String durationDays,
    required String price,
  }) async {
    try {
      final user = await LocalBase.getUserData();
      if (user == null) {
        return const ApiData(
            success: false, msg: "سجل الدخول مره اخري", data: []);
      }
      var response = await http.post(
        Uri.parse("$domain/api/Plan"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}'
        },
        body: jsonEncode({
          "planName": planName,
          "durationDays": durationDays,
          "price": price
        }),
      );
      final data = jsonDecode(response.body);

      return ApiData(
          success: data['StatusCode'] == 201,
          msg: data['Message'],
          data: data['Data']);
    } catch (e) {
      return ApiData(success: false, msg: "$e", data: []);
    }
  }

  static Future<ApiData<List<PlanModel>>> getAllPlans() async {
    try {
      final url = Uri.parse("$domain/api/Plan");
      final user = await LocalBase.getUserData();
      if (user == null) {
        return const ApiData<List<PlanModel>>(
            success: false, msg: "سجل الدخول مره اخري", data: []);
      }

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
      );
      final plans = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ApiData<List<PlanModel>>(
            success: true,
            msg: plans['Message'],
            data: PlanModel.fromMapList(plans['Data']));
      } else {
        return ApiData<List<PlanModel>>(
            success: false, msg: plans['Message'], data: []);
      }
    } catch (e) {
      return ApiData<List<PlanModel>>(success: false, msg: "$e", data: []);
    }
  }

  static Future<ApiData> updatePlanById(
      {required String planName,
      required String durationDays,
      required String price,
      required int planId}) async {
    try {
      final url = Uri.parse("$domain/api/Plan/$planId");

      final user = await LocalBase.getUserData();
      if (user == null) {
        return const ApiData(
            success: false, msg: "سجل الدخول مره اخري", data: []);
      }
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
        body: jsonEncode({
          'id': planId,
          'planName': planName,
          'durationDays': durationDays,
          'price': price,
        }),
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

  static Future<ApiData<List<PlanModel>>> getPlanType(
      {required bool day}) async {
    try {
      final url = Uri.parse("$domain/api/Plan");
      final user = await LocalBase.getUserData();
      if (user == null) {
        return const ApiData<List<PlanModel>>(
            success: false, msg: "سجل الدخول مره اخري", data: []);
      }

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
      );
      final plans = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiData<List<PlanModel>>(
            success: true,
            msg: plans['Message'],
            data: PlanModel.fromMapList(plans['Data']).where(
              (element) {
                if (day) {
                  return element.durationDays == 1;
                } else {
                  return element.durationDays != 1 && element.durationDays != 0;
                }
              },
            ).toList());
      } else {
        return ApiData<List<PlanModel>>(
            success: false, msg: plans['Message'], data: []);
      }
    } catch (e) {
      return ApiData<List<PlanModel>>(success: false, msg: "$e", data: []);
    }
  }
}
