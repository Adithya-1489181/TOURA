import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

// TODO: Have to look at the url_launcher more
// TODO: Look at and use the location package
// TODO: flutter_map + grasshoppper for direction it works fine for trial (https://www.reddit.com/r/FlutterDev/comments/1b7v3kj/flutter_maps_and_navigation_for_free/)
class MelojourneyPage extends StatelessWidget {
  const MelojourneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(20.5937, 78.9629),
          initialZoom: 4.5,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => launchUrl(
                  Uri.parse('https://openstreetmap.org/copyright'),
                  mode: LaunchMode.externalApplication,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
