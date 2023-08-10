import 'dart:convert';

import 'package:apps_kurir/app/modules/beranda/models/Warehouse.dart';
import 'package:http/http.dart' as http;
void main() async{
  Uri url = Uri.parse('http://localhost:8000/api/v1/customer');
  var res = await http.get(url);

  // print(res.body);
  Map<String, dynamic> result = jsonDecode(res.body);
  Map<String, dynamic> data = result['data'];
  // Map<String, dynamic> dataMap = data['dataList'];
  // List<dynamic> dataList = dataMap.values.toList();
  List<dynamic> list = data['dataList'];

  // Warehouse listCustomer = Warehouse.fromJson(list[0]);
  // print(listCustomer.toJson());
  print(list);
}