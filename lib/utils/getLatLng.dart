import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

LatLng getLatLng(String valor) {
  final latLng = valor.substring(4).split(',');
  final lat = double.parse(latLng[0]);
  final lng = double.parse(latLng[1]);

  return LatLng(lat, lng);
}
