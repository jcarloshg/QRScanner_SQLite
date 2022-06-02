import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sec_9_qrreader/utils/getLatLng.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  MapType mapType = MapType.normal;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final geo = ModalRoute.of(context)?.settings.arguments;

    LatLng pointIni = getLatLng(geo as String);

    final CameraPosition pointInitial = CameraPosition(
      target: pointIni,
      // target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 17,
      tilt: 50,
    );

    // marcadores

    Set<Marker> markes = <Marker>{};
    markes.add(
      Marker(
        markerId: const MarkerId('geo-locatio'),
        position: pointIni,
      ),
    );

    Future<void> _goToTheLake() async {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: pointIni,
            zoom: 17,
            tilt: 50,
          ),
        ),
      );
    }

    final appBar2 = AppBar(
      title: const Text('Mapas'),
      actions: [
        IconButton(
          onPressed: () => _goToTheLake(),
          icon: const Icon(Icons.location_on_sharp),
        )
      ],
    );

    final floatingActionButton2 = FloatingActionButton(
      child: const Icon(Icons.layers),
      onPressed: () {
        // if (mapType == MapType.normal) {
        //   mapType = MapType.satellite;
        // } else {
        //   mapType = MapType.normal;
        // }

        setState(() {
          mapType =
              mapType == MapType.normal ? MapType.satellite : MapType.normal;
        });
      },
    );

    return Scaffold(
      appBar: appBar2,
      floatingActionButton: floatingActionButton2,
      body: GoogleMap(
        mapType: mapType,
        markers: markes,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: pointInitial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
