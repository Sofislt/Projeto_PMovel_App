import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapPage extends StatefulWidget {
  final LatLng posicao;
  const mapPage({super.key, required this.posicao});

  @override
  State<mapPage> createState() => mapPageState();
}

class mapPageState extends State<mapPage> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: widget.posicao,
          zoom: 17,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}