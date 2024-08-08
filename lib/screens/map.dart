import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HeatmapPage extends StatelessWidget {
  const HeatmapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example data: List of LatLng for Mauritius with titles
    final List<Map<String, dynamic>> heatmapData = [
      {'location': LatLng(-20.348404, 57.552152), 'title': 'High Fever'},
      {'location': LatLng(-20.294363, 57.433345), 'title': ''},
      {'location': LatLng(-20.275944, 57.538278), 'title': 'Mild Fever'},
      {'location': LatLng(-20.200654, 57.447785), 'title': 'low fever'},
      // Add more locations as needed
    ];

    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center:
              LatLng(-20.2314, 57.4896), // Center map on Port Louis, Mauritius
          zoom: 12.5, // Adjust zoom level as needed
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: heatmapData.map((data) {
              return Marker(
                point: data['location'],
                width: 150.0,
                height: 150.0,
                builder: (context) => Container(
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          '●',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        data['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
