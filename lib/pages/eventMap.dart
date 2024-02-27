import 'package:camelendar/models/event_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

class EventMap extends StatelessWidget {
  final List<Event> eventList;

  const EventMap({Key? key, required this.eventList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(51.509364, -0.128928),
              zoom: 3.2,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://mt.google.com/vt/lyrs=y&x={x}&y={y}&z={z}',
                userAgentPackageName: 'com.example.app',
                tileDisplay: TileDisplay.fadeIn(),
              ),
              MarkerLayer(
                markers: eventList
                    .map((event) => Marker(
                          width: 20,
                          height: 20,
                          point: LatLng(event.mapLat, event.mapLng),
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(event.title),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(event.description),
                                          SizedBox(height: 5),
                                          Text(
                                              'Date: ${DateFormat('yyyy-MM-dd').format(event.dateStart)}'),
                                          SizedBox(height: 5),
                                          Text('Location: ${event.location}'),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                child: Image.network(
                                  "https://camelworldmap.com/uploads/logos/${event.logo}",
                                  width: 60, // Adjust size as needed
                                  height: 60, // Adjust size as needed
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
