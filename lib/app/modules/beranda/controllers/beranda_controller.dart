// import 'package:apps_kurir/app/data/source/customer.dart';
import 'dart:convert';

import 'package:apps_kurir/app/modules/beranda/models/Warehouse.dart';
import 'package:apps_kurir/app/modules/home/controllers/cLogin.dart';
import 'package:apps_kurir/app/modules/home/views/loginPages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BerandaController extends GetxController {
  final cLogin = Get.put(CLogin());
  
  Future<List<Warehouse>> getAllCustomer() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Uri url = Uri.parse('https://logisticrew.com/api/v1/customers');
    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    final res = await http.get(url, headers: headers);
    // print(headers);

    Map<String, dynamic> result = jsonDecode(res.body);
    Map<String, dynamic> data = result['data'];
    List<dynamic> dataList = data['dataList'];

    print("ini data : $dataList");


    if (dataList == null || dataList.isEmpty) {
      return [];
    } else {
      List<Warehouse> customers =
          dataList.map((e) => Warehouse.fromJson(e)).toList();
      return customers;
    }
  }

  Future<void> logout(BuildContext context) async {
    // Hapus data penyimpanan lokal
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear(); // atau prefs.remove('sessionKey');

    // Navigasi ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPages()),
    );
  }
}
