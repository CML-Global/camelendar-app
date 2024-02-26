import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:camelendar/models/event_Model.dart';

class EventMap extends StatefulWidget {
  final List<Event> eventList;

  const EventMap({required this.eventList});

  @override
  State<EventMap> createState() => _EventMapState();
}

class _EventMapState extends State<EventMap> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    _addMarkers();
  }

  void _addMarkers() {
    widget.eventList.forEach((event) {
      final marker = Marker(
        markerId: MarkerId(event.id.toString()),
        position: LatLng(event.mapLat, event.mapLng),
        infoWindow: InfoWindow(title: event.title, snippet: event.description),
      );
      _markers.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 500,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: _onMapCreated,
          markers: _markers,
        ),
      ),
    );
  }
}
