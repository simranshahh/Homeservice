// ignore_for_file: library_private_types_in_public_api, avoid_print, unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Dmap extends StatefulWidget {
  const Dmap({super.key});

  @override
  _DmapState createState() => _DmapState();
}

class _DmapState extends State<Dmap> {
  final geolocator =
      Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
  Position? _currentPosition;
  String currentAddress = "";

  void getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  void getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      // Placemark place = p[0];

      setState(() {
        currentAddress =
            "${_currentPosition!.latitude},${_currentPosition!.longitude}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Location"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(Icons.location_on),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: getCurrentLocation,
                                child: Text(
                                  'Get Location',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              if (_currentPosition != null &&
                                  currentAddress != null)
                                Text(currentAddress,
                                    style: const TextStyle(fontSize: 20.0))
                              else
                                const Text("Could'nt fetch the location"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
