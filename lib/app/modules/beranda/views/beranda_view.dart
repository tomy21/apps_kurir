import 'package:apps_kurir/app/modules/beranda/views/mapsRute.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config/app_color.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  const BerandaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final List<Map<String, dynamic>> listGudang = [
      {
        "Warehouse": "Gudang Gravity",
        "Status": "Picked",
        "Desc": "Warehouse",
        "Address":
            "Jalan Sutera Cemara 2 nomor 2, alam sutera, serpong utara Pakulonan - Serpong Utara, Tangerang Selatan",
        "Paket": 200,
        "latitude" : -6.25424,
        "longitude" : 106.6539,
      },
      {
        "Warehouse": "Gudang Kemanggisan",
        "Status": "Drop paket",
        "Desc": "HUB",
        "Address":
            "Jl. Kemanggisan Raya No.127, RT.5/RW.13, Kemanggisan, Kec. Palmerah, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11480",
        "Paket": 200,
        "latitude": -6.18872526611066,
        "longitude": 106.786845896543,
      },
      {
        "Warehouse": "Barron Warehouse",
        "Status": "On the way",
        "Desc": "Warehouse",
        "Address":
            "Jl. Rasuna Said No.38, RT.004/RW.002, Panunggangan Utara, Kec. Pinang, Kota Tangerang, Banten 15143 Panunggangan Utara - Pinang, Tangerang",
        "Paket": 0,
        "latitude": -6.21804,
        "longitude": 106.6479,
      },
      {
        "Warehouse": "Gudang Sunter 2",
        "Status": "On the way",
        "Desc": "Warehouse",
        "Address":
            "Jalan Sutera Cemara 2 nomor 2, alam sutera, serpong utara Pakulonan - Serpong Utara, Tangerang Selatan",
        "Paket": 0,
        "latitude": -6.21804,
        "longitude": 106.6479,
      },
      {
        "Warehouse": "Gudang Sunter 2",
        "Status": "On the way",
        "Desc": "Warehouse",
        "Address":
            "Jalan Sutera Cemara 2 nomor 2, alam sutera, serpong utara Pakulonan - Serpong Utara, Tangerang Selatan",
        "Paket": 0,
        "latitude": -6.21804,
        "longitude": 106.6479,
      },
      {
        "Warehouse": "Gudang Sunter 2",
        "Status": "On the way",
        "Desc": "Warehouse",
        "Address":
            "Jalan Sutera Cemara 2 nomor 2, alam sutera, serpong utara Pakulonan - Serpong Utara, Tangerang Selatan",
        "Paket": 0,
        "latitude": -6.21804,
        "longitude": 106.6479,
      },
    ];

    return Scaffold(
      extendBody: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 159,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColor.btnPrimary, AppColor.textWhite],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.textSoft,
                          spreadRadius: 2,
                          blurRadius: 2,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 11,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: AppColor.textSoft,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: Center(
                                child: const Text(
                                  'ini foto',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                            Container(
                              width: 210,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Hallo, Selamat bekerja,,',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  const Text(
                                    'Tomy Agung Saputro',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Kurir Motorist',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () => () {},
                                icon: Icon(
                                  Icons.notifications,
                                  size: 20,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dompet Kamu',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.textSoft,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Rp. 300.000',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Rute kamu hari ini',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: listGudang.map((data) {
                print(data["Warehouse"]);
                return Card(
                  color: data["Desc"] == "HUB"
                      ? AppColor.btnSecondary
                      : AppColor.btnPrimary,
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 300,
                              child: InkWell(
                                onTap: () => Get.to(()=> MapsRute(lat : data['latitude'], long : data['longitude'] )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${data['Warehouse']}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: data["Desc"] == "HUB"
                                            ? AppColor.textPrimary
                                            : AppColor.textWhite,
                                      ),
                                    ),
                                    Text(
                                      "${data['Address']}",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: data["Desc"] == "HUB"
                                            ? AppColor.textPrimary
                                            : AppColor.textWhite,
                                      ),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColor.textWhite,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: data["Status"] == "On the way"
                                        ? AppColor.btnSecondary
                                        : data["Status"] == "Picked"
                                            ? AppColor.bgFloat
                                            : AppColor.btnPrimary,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    data["Status"],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: data["Desc"] == "HUB"
                                          ? AppColor.textPrimary
                                          : AppColor.textWhite,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${data["Paket"]} Paket',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: data["Desc"] == "HUB"
                                      ? AppColor.textPrimary
                                      : AppColor.textWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
