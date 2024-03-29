// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:async';
import 'bus.dart';
import 'place.dart';
import 'place_details.dart';
import 'place_list.dart';
import 'place_map.dart';
import 'stub_data.dart';

enum PlaceTrackerViewType {
  map,
  list,
}

class PlaceTrackerApp extends StatelessWidget {
  const PlaceTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff741D4A),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff741D4A),
          foregroundColor: Colors.white,
        ),
      ),
      routerConfig: GoRouter(routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const _PlaceTrackerHomePage(),
          routes: [
            GoRoute(
              path: 'place/:id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                final place = context
                    .watch<AppState>()
                    .places
                    .singleWhere((place) => place.id == id);
                return PlaceDetails(place: place);
              },
            ),
          ],
        ),
      ]),
    );
  }
}

class _PlaceTrackerHomePage extends StatelessWidget {
  const _PlaceTrackerHomePage();

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
              child: Image.asset('assets/logo.png', fit: BoxFit.cover)
              // child: Icon(Icons.pin_drop, size: 24.0),
            ),
            Text('ShuttleTrak'),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
            child: IconButton(
              icon: Icon(
                state.viewType == PlaceTrackerViewType.map
                    ? Icons.list
                    : Icons.map,
                size: 32.0,
              ),
              onPressed: () {
                state.setViewType(
                  state.viewType == PlaceTrackerViewType.map
                      ? PlaceTrackerViewType.list
                      : PlaceTrackerViewType.map,
                );
              },
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: state.viewType == PlaceTrackerViewType.map ? 0 : 1,
        children: const [
          PlaceMap(center: LatLng(43.262950, -79.922151)),
          PlaceList(),
          // GoogleMap(
          //   initialCameraPosition: CameraPosition(
          //     target: LatLng(43.262950, -79.922151),
          //     zoom: 0,
          //   ),
          //   zoomGesturesEnabled: false,
          //   rotateGesturesEnabled: false,
          //   tiltGesturesEnabled: false,
          //   scrollGesturesEnabled: false,
          // ),
        ],
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  AppState({
    this.places = StubData.places,
    this.selectedCategory = Pages.information,
    this.viewType = PlaceTrackerViewType.map,
}) : bus = Bus(id: 'bus_marker123', latLng: LatLng(43.2655854, -79.9178141)) {
_startPeriodicDataFetch(); // Correctly reference _startPeriodicDataFetch here
print("Started Periodic Data Fetch");
print(bus.latLng.toString());
}
  
//////////////////////////////////////////////////////////////////////////////////////////////
  LatLng? currentLatLng;
  List<Place> places;
  Pages selectedCategory;
  PlaceTrackerViewType viewType;
  Timer? _dataFetchTimer;
  Bus bus = Bus(id: 'bus_marker', latLng: LatLng(-79.9178141, 43.2655854));


  void _startPeriodicDataFetch() {
    _dataFetchTimer = Timer.periodic(const Duration(seconds: 30), (Timer t) {
      fetchDataFromServer();
    }); // Periodically fetch data from server
  }

  
  @override
  void dispose() {
    _dataFetchTimer?.cancel();
    super.dispose();
  }


  void updateBusLocation(LatLng newLocation) {
    bus.updateLatLng(newLocation);
    print("Updated Location!");
    notifyListeners(); // Notify listeners about the change
    print("Notified!");
    print(bus.latLng.toString());
    
  }


  Future<void> fetchDataFromServer() async {
  var url = Uri.parse('INSERT IP HERE');
  try {
    var headers = {'X-Requested-With': 'XMLHttpRequest'};
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // Explicitly type 'data' as Map<String, dynamic>
      var data = json.decode(response.body) as Map<String, dynamic>;
      // Check if keys exist and values are of expected types
      if (data.containsKey('latitude') && data['latitude'] is double &&
          data.containsKey('longitude') && data['longitude'] is double) {
        double latitude = data['latitude'] as double;
        double longitude = data['longitude'] as double;
        currentLatLng = LatLng(latitude, longitude);
        print(data['latitude'] as double);
        print(data['longitude'] as double);
        updateBusLocation(currentLatLng!);
        notifyListeners(); // Notify listeners to update UI or other components
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}
  

  void setViewType(PlaceTrackerViewType viewType) {
    this.viewType = viewType;
    notifyListeners();
  }

  void setSelectedCategory(Pages newCategory) {
    selectedCategory = newCategory;
    notifyListeners();
  }

  void setPlaces(List<Place> newPlaces) {
    places = newPlaces;
    notifyListeners();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppState &&
        other.places == places &&
        other.selectedCategory == selectedCategory &&
        other.viewType == viewType;
  }

  @override
  int get hashCode => Object.hash(places, selectedCategory, viewType);
}
