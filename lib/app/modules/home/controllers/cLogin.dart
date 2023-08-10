import 'dart:convert';

import 'package:apps_kurir/app/modules/home/model/modelLogin.dart';
import 'package:apps_kurir/app/modules/home/views/beranda.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';

import '../../beranda/views/beranda_view.dart';

class CLogin extends GetxController {
  RxBool hidden = true.obs;
  Rx<UserModel?> user = Rx<UserModel?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Cek status login saat aplikasi dimulai
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      final storage = GetStorage();
      final userData = storage.read('userData');

      if (userData != null) {
        user.value = UserModel.fromJson(userData);
      }
    }
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      final client = http.Client();
      final response = await client.post(
        Uri.parse('https://logisticrew.com/api/v1/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      client.close();
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final token = jsonData['data']['token']['token'];
        final userData = jsonData['data']['users'];

        print(userData);
        user.value = UserModel.fromJson(userData);

        // Simpan token ke shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        // Simpan data pengguna ke GetStorage
        final storage = GetStorage();
        storage.write('userData', userData);

        Get.offAll(() => BerandaView());
      } else {
        Fluttertoast.showToast(
          msg: "Login gagal. Periksa kembali email dan password Anda.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      
      Fluttertoast.showToast(
        msg: "Terjadi kesalahan. Periksa koneksi internet Anda.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    // Hapus informasi login dari shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');

    // Hapus data pengguna dari GetStorage
    final storage = GetStorage();
    storage.remove('userData');

    // Tambahkan logika untuk navigasi ke halaman login setelah logout berhasil
  }
}
