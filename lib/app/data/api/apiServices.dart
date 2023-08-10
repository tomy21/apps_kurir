import 'dart:convert';
import 'package:apps_kurir/app/modules/beranda/models/Warehouse.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetxController {
  var data = <Warehouse>[].obs;
  var isLoading = false.obs;

  Future<void> fetchDataFromApi() async {
    try {
      isLoading(true);

      var response = await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/customer'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List<dynamic>;
        data.value = jsonData.map((item) => Warehouse.fromJson(item)).toList();
      }
    } finally {
      isLoading(false);
    }
  }
}
