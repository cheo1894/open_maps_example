import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class OsmMap extends StatefulWidget {
  final MapController mapController;

  const OsmMap({super.key, required this.mapController});

  @override
  State<OsmMap> createState() => _OsmMapState();
}

class _OsmMapState extends State<OsmMap> {
  ZoomOption zoomOptions = ZoomOption(
    initZoom: 10,
    minZoomLevel: 3,
    maxZoomLevel: 19,
    stepZoom: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: widget.mapController,
      osmOption: OSMOption(
        userTrackingOption: UserTrackingOption(enableTracking: true, unFollowUser: false),
        zoomOption: zoomOptions,
      ),
    );
  }
}
