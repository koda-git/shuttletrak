//import 'dart:ffi';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Bus {
  final String id;
  LatLng latLng;
  bool handicapped = false;
  Bus({required this.id, required this.latLng});

  void updateLatLng(LatLng newLatLng) {
    latLng = newLatLng;
  }
}