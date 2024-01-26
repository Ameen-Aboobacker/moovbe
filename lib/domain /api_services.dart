import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moovbe/application/core.dart';

import '../data/bus/bus_model.dart';
import '../data/driver_model/driver_model.dart';

class ApiServices {
  static login(String username, String password) async {
    final response = await http.post(
        Uri.parse('https://flutter-api.noviindus.in/api/LoginApi'),
        body: {
          'username': username,
          'password': password,
        });
    if (response.statusCode == 200) {
      final authData = jsonDecode(response.body);
      final token = authData['access_token'];
      return token;
    }
  }

  static fetchBusData() async {
    final response = await http.get(
      Uri.parse('https://flutter-api.noviindus.in/api/BusListApi'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final busData = jsonDecode(response.body);
      final busModel = BusModel.fromJson(busData);
      return busModel;
    }
  }

  static fetchDriverData() async {
    final response = await http.get(
      Uri.parse('https://flutter-api.noviindus.in/api/DriverApi'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      final driverData = jsonDecode(response.body);
      final driverModel = DriverModel.fromJson(driverData);
      return driverModel;
    }
  }

  static saveDriver(Drivers driver) async {
    final response = await http.post(
        Uri.parse('https://flutter-api.noviindus.in/api/DriverApi'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
        body: {
          'name': driver.name,
          'mobile': driver.mobile,
          'license_no': driver.licenseNo
        });

    if (response.statusCode == 200) {
      final driverData = jsonDecode(response.body);
      final message = driverData['message'];
      return message;
    }
  }

  static deleteDriver(String driverid) async {
    final response = await http.delete(
      Uri.parse('https://flutter-api.noviindus.in/api/DriverApi'),
      headers: {'Authorization': 'Bearer $accessToken'},
      body: {'driver_id': driverid},
    );

    if (response.statusCode == 200) {
      final driverData = jsonDecode(response.body);
      final message = driverData['message'];
      return message;
    }
  }
}
