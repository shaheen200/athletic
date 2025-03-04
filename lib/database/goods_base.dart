import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:athletic/models/good_model.dart';
import 'package:http/http.dart' as http;

class GoodsBase {
  static Future<ApiData<GoodModel?>> add({
    required String name,
    required double price,
    required int count,
    required bool isActive,
  }) async {
    final url = Uri.parse('$domain/api/Product');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData<GoodModel?>(
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
          'name': name,
          'price': price,
          'count': count,
          'isActive': isActive,
        }),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return ApiData<GoodModel?>(
            success: true,
            msg: data['message'],
            data: GoodModel(
                id: data['data']['id'],
                name: name,
                price: price,
                count: count,
                isActive: isActive));
      } else {
        return ApiData<GoodModel?>(
            success: false, msg: data['message'], data: null);
      }
    } catch (e) {
      return ApiData<GoodModel?>(success: false, msg: "Error: $e", data: null);
    }
  }

  static Future<ApiData<GoodModel?>> updateProduct({
    required int id,
    required String name,
    required double price,
    required int count,
    required bool isActive,
  }) async {
    final url = Uri.parse('$domain/api/Product/$id');
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
        body: jsonEncode({
          'name': name,
          'price': price,
          'count': count,
          'isActive': isActive,
        }),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiData<GoodModel?>(
            success: true,
            msg: data['message'],
            data: GoodModel.fromJson(data['data']));
      } else {
        return ApiData<GoodModel?>(
            success: false, msg: data['message'], data: null);
      }
    } catch (e) {
      return ApiData<GoodModel?>(success: false, msg: "Error: $e", data: null);
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
        final list = products['data'] as List;
        return ApiData<List<GoodModel>>(
            success: true,
            msg: products['message'],
            data: list
                .map(
                  (e) => GoodModel(
                      id: 1,
                      name: e['name'],
                      price: e['price'],
                      count: e['count'],
                      isActive: e['isAvailable']),
                )
                .toList());
      } else {
        return ApiData<List<GoodModel>>(
            success: true, msg: products['message'], data: []);
      }
    } catch (e) {
      return ApiData<List<GoodModel>>(success: true, msg: '$e', data: []);
    }
  }
}
