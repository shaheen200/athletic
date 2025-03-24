import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:athletic/models/offer_model.dart';
import 'package:http/http.dart' as http;

class OfferBase {
  static Future<ApiData> add({
    required String planId,
    required String discountedPrice,
    required String startDate,
    required String endDate,
  }) async {
    try {
      final user = await LocalBase.getUserData();
      if (user == null) {
        return const ApiData(
            success: false, msg: "سجل الدخول مره اخري", data: []);
      }
      var response = await http.post(
        Uri.parse("$domain/api/Offer"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}'
        },
        body: jsonEncode({
          "PlanId": planId,
          "DiscountedPrice": discountedPrice,
          "StartDate": startDate,
          "EndDate": endDate
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

  static Future<ApiData<List<OfferModel>>> getAlloffer() async {
    try {
      final url = Uri.parse("$domain/api/Offer");
      final user = await LocalBase.getUserData();
      if (user == null) {
        return const ApiData<List<OfferModel>>(
            success: false, msg: "سجل الدخول مره اخري", data: []);
      }

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
      );
      final offer = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiData<List<OfferModel>>(
            success: true,
            msg: offer['Message'],
            data: OfferModel.fromMapList(offer['Data']));
      } else {
        return ApiData<List<OfferModel>>(
            success: false, msg: offer['Message'], data: []);
      }
    } catch (e) {
      return ApiData<List<OfferModel>>(success: false, msg: "$e", data: []);
    }
  }

  static Future<ApiData> updatePlanById(
      {required String planId,
      required String discountedPrice,
      required String startDate,
      required String endDate,
      required int offerId}) async {
    try {
      final url = Uri.parse("$domain/api/Offer/$offerId");

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
          "PlanId": planId,
          "DiscountedPrice": discountedPrice,
          "StartDate": startDate,
          "EndDate": endDate
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

  static Future<ApiData> delete({
    required String offerId,
  }) async {
    try {
      final user = await LocalBase.getUserData();
      if (user == null) {
        return const ApiData(
            success: false, msg: "سجل الدخول مره اخري", data: []);
      }
      var response = await http.delete(
        Uri.parse("$domain/api/Offer/$offerId"),
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
