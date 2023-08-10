import 'dart:convert';

import 'package:apps_kurir/app/data/config/api_config.dart';
import 'package:apps_kurir/app/data/config/appRequest.dart';
import 'package:apps_kurir/app/modules/beranda/models/Warehouse.dart';
import 'package:get/get.dart';

class SourcesCustomer extends GetConnect{
  static Future<List<Warehouse>> gets() async {
    String url = '${ApiConfig.customer}';
    String? responseBody = await AppRequest.gets(url);
    if (responseBody != null) {
      Map<String, dynamic> result = jsonDecode(responseBody);
      if (result['success'] == 200) {
        List<dynamic> list = result['data'];
        return list.map((e) => Warehouse.fromJson(e as Map<String, dynamic>)).toList();
        print(list);
      }
      return [];
    }
    return [];
  }
}