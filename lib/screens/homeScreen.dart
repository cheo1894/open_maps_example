import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:open_maps_example/utils/debouncer.dart';
import 'package:open_maps_example/widgets/addressList.dart';
import 'package:open_maps_example/widgets/no_result_text.dart';
import 'package:open_maps_example/widgets/osm_map.dart';
import 'package:open_maps_example/widgets/search_input.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  MapController mapController = MapController(
    initPosition: GeoPoint(latitude: 37.7749, longitude: -122.4194),
  );

  bool backgroundSearch = false;

  @override
  void dispose() {
    // TODO: implement dispose
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Open Maps Example')),
      body: Stack(
        children: [
          OsmMap(mapController: mapController),

          Container(
            color: backgroundSearch ? Colors.grey[100] : null,
            child: Column(
              children: [
                SearchInput(
                  backgroundSearch: backgroundSearch,
                  onChanged: (val) {
                    //searchAddress(val);
                  },
                  onTap: () {
                    backgroundSearch = true;
                    setState(() {});
                  },
                  onPressed: () {
                    backgroundSearch = false;
                    setState(() {});
                  },
                ),
                //if (resultSearch.isNotEmpty && backgroundSearch)
                // AddressList(resultSearch: resultSearch),

                //if (resultSearch.isEmpty && backgroundSearch) NoResultText(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton:
          !backgroundSearch
              ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await mapController.zoomIn();
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () async {
                        await mapController.zoomOut();
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ],
                ),
              )
              : null,
    );
  }
}
