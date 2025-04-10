import 'dart:convert';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:athletic/models/equepment_models.dart';
import 'package:athletic/models/fix_equipment_model.dart';
import 'package:http/http.dart' as http;

class EquipmentBase {
  static Future<ApiData<EquepmentModels?>> addEquipment({
    required String equipmentName,
    required String description,
    required bool isAvailable,
  }) async {
    final url = Uri.parse('$domain/api/Equipment');
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
          'equipmentName': equipmentName,
          'description': description,
          'isAvailable': isAvailable,
          'lastMaintenanceDate': '${DateTime.now()}'.split(' ')[0],
        }),
      );
      final data = jsonDecode(response.body);
      return ApiData<EquepmentModels?>(
          success: data['StatusCode'] == 201,
          msg: data['Message'],
          data: EquepmentModels(
              id: data['Data']['Id'],
              name: data['Data']['EquipmentName'],
              state: data['Data']['IsAvailable'],
              price: data['Data']['Description']));
    } catch (e) {
      return ApiData<EquepmentModels?>(
          success: false, msg: "Error: $e", data: null);
    }
  }

  static Future<ApiData<EquepmentModels?>> updateEquipmentById({
    required int id,
    required String equipmentName,
    required String description,
    required bool isAvailable,
  }) async {
    final url = Uri.parse('$domain/api/Equipment/$id');

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
          'equipmentName': equipmentName,
          'description': description,
          'isAvailable': isAvailable,
          'lastMaintenanceDate': '${DateTime.now()}'.split(' ')[0],
        }),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiData<EquepmentModels?>(
            success: true,
            msg: data['Message'],
            data: EquepmentModels(
                id: data['Data']['Id'],
                name: data['Data']['EquipmentName'],
                state: data['Data']['IsAvailable'],
                price: data['Data']['Description']));
      } else {
        return ApiData<EquepmentModels?>(
            success: false, msg: data['Message'], data: null);
      }
    } catch (e) {
      return ApiData<EquepmentModels?>(success: false, msg: "$e", data: null);
    }
  }

  static Future<ApiData<List<EquepmentModels>>> getAllEquipment() async {
    final url = Uri.parse('$domain/api/Equipment');

    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData<List<EquepmentModels>>(
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
        return ApiData<List<EquepmentModels>>(
            success: true,
            msg: data['Message'],
            data: EquepmentModels.fromListMap(data['Data']['Data']));
      } else {
        return ApiData<List<EquepmentModels>>(
            success: false, msg: data['Message'], data: []);
      }
    } catch (e) {
      return ApiData<List<EquepmentModels>>(
          success: false, msg: "$e", data: []);
    }
  }

  static Future<ApiData> fixEquipment({
    required int id,
    required String price,
    required String note,
  }) async {
    final url = Uri.parse('$domain/api/RepairEquipment');

    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData<List<EquepmentModels>>(
          success: false, msg: "سجل الدخول مره اخري", data: []);
    }

    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${user.token}',
          },
          body: jsonEncode(
              {"equipmentId": id, "description": note, "cost": price}));
      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return ApiData(success: true, msg: data['Message'], data: []);
      } else {
        return ApiData(success: false, msg: data['Message'], data: []);
      }
    } catch (e) {
      return ApiData(success: false, msg: "$e", data: []);
    }
  }

  static Future<ApiData<List<FixEquipmentModel>>> getRepairByEquipmentId(
      int equipmentId) async {
    final url = Uri.parse('$domain/api/RepairEquipment/$equipmentId');
    final user = await LocalBase.getUserData();
    if (user == null) {
      return const ApiData<List<FixEquipmentModel>>(
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
      final repairDetails = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return ApiData<List<FixEquipmentModel>>(
            success: true,
            msg: repairDetails['Message'],
            data: FixEquipmentModel.convertListToModel(repairDetails['Data']));
      } else {
        return ApiData<List<FixEquipmentModel>>(
            success: false, msg: repairDetails['Message'], data: []);
      }
    } catch (e) {
      return ApiData(success: false, msg: '$e', data: []);
    }
  }
}
