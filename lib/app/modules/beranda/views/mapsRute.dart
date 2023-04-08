import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../config/app_color.dart';

class MapsRute extends StatelessWidget {
  const MapsRute({Key? key, required this.lat, required this.long})
      : super(key: key);
  final double? lat;
  final double? long;
  

  @override
  Widget build(BuildContext context) {
    print("ini lat: $lat, ini long : $long");
    Completer<GoogleMapController> _controller = Completer();
    // final GoogleMapController _controller;
    void onMapCreated(GoogleMapController controller){
      _controller.complete(controller);
    }

    return Scaffold(
      body: GoogleMap(
        onMapCreated: onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat!, long!),
          zoom: 14.0,
        ),
        mapType: MapType.normal,
      ),
    );
  }

  
}
