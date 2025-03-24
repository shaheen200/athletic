import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:athletic/models/good_model.dart';
import 'package:athletic/models/plan_model.dart';
import 'package:http/http.dart' as http;

class OrderBase {
  static Future<ApiData> add({
    required String goodId,
    required String count,
  }) async {
    try {
      final user = await LocalBase.getUserData();
      if (user == null) {
        return const ApiData(
            success: false, msg: "سجل الدخول مره اخري", data: []);
      }
      var response = await http.post(
        Uri.parse("$domain/api/Order"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}'
        },
        body: jsonEncode({"productId": goodId, "count": count}),
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

  static Future<ApiData<List<PlanModel>>> getAllOrder() async {
    try {
      final url = Uri.parse("$domain/api/Order");
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
            success: true, msg: plans['message'], data: []);
      } else {
        return ApiData<List<PlanModel>>(
            success: false, msg: plans['message'], data: []);
      }
    } catch (e) {
      return ApiData<List<PlanModel>>(success: false, msg: "$e", data: []);
    }
  }

  static Future<ApiData<List<GoodModel>>> getAllProduct() async {
    final url = Uri.parse('$domain/api/Product');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData<List<GoodModel>>(
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
      final products = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final list = products['Data'] as List;
        return ApiData<List<GoodModel>>(
            success: true,
            msg: products['Message'],
            data: list
                .map(
                  (e) => GoodModel(
                      id: e['Id'],
                      name: e['Name'],
                      price: e['Price'],
                      count: e['Count'],
                      isActive: e['IsAvailable']),
                )
                .toList()
                .where((element) => element.count != 0 && element.isActive)
                .toList());
      } else {
        return ApiData<List<GoodModel>>(
            success: true, msg: products['Message'], data: []);
      }
    } catch (e) {
      return ApiData<List<GoodModel>>(success: true, msg: '$e', data: []);
    }
  }
}
