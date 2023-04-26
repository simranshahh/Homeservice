// ignore_for_file: prefer_const_constructors, file_names, avoid_function_literals_in_foreach_calls, unused_element, avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

class GoogleMapPage extends ConsumerStatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends ConsumerState<GoogleMapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  List<LatLng> polylineCoordinates = [];

  final Location location = Location();

  PermissionStatus? _permissionGranted;

  Future<void> _checkPermissions() async {
    final PermissionStatus permissionGrantedResult =
        await location.hasPermission();
    setState(() {
      _permissionGranted = permissionGrantedResult;
    });
  }

  Future<void> _requestPermission() async {
    if (_permissionGranted != PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult =
          await location.requestPermission();
      setState(() {
        _permissionGranted = permissionRequestedResult;
      });
    }
  }

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        ref.read(locationStateProvider.notifier).setLocation(location);
        print('location: $location');
      },
    );

    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen(
      (newLoc) {
        ref.read(locationStateProvider.notifier).setLocation(newLoc);
        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 18,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ),
            ),
          ),
        );
      },
    );
  }

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    // _requestPermission();
    // _checkPermissions();
    getCurrentLocation();
    super.initState();
  }

  Marker? currentMArker;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final location = ref.watch(locationStateProvider);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Column(children: [
          location.currentLocation == null
              ?

              // ElevatedButton(
              //     onPressed: _permissionGranted == PermissionStatus.granted
              //         ? null
              //         : _requestPermission,
              //     child: Text('Request'),
              //   )

              SizedBox(
                  height: height * 0.6,
                  child: Center(
                      child: Text(
                    'Permission status: ${_permissionGranted ?? "unknown"}',
                  )))
              : SizedBox(
                  height: height * 0.6,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(location.currentLocation!.latitude!,
                          location.currentLocation!.longitude!),
                      zoom: 13.5,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId("currentLocation"),
                        icon: currentLocationIcon,
                        position: LatLng(location.currentLocation!.latitude!,
                            location.currentLocation!.longitude!),
                      ),
                    },
                    onMapCreated: (mapController) {
                      _controller.complete(mapController);
                    },
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId("route"),
                        points: polylineCoordinates,
                        color: const Color(0xFF7B61FF),
                        width: 6,
                      ),
                    },
                  ),
                ),
          location.currentLocation != null
              ? Text(
                  "${location.currentLocation!.latitude.toString()},${location.currentLocation!.longitude.toString()}")
              : SizedBox(
                  height: 0,
                )
        ]));
  }
}

class LocationState extends ChangeNotifier {
  LocationData? currentLocation;
  setLocation(LocationData location) {
    currentLocation = location;
    notifyListeners();
  }

  getLocation() {
    return currentLocation;
  }
}

final locationStateProvider =
    ChangeNotifierProvider<LocationState>((ref) => LocationState());









// // ignore_for_file: prefer_const_constructors, file_names, avoid_function_literals_in_foreach_calls

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:nb_utils/nb_utils.dart';

// import '../../Services/constants.dart';

// class GoogleMapPagesss extends StatefulWidget {
//   const GoogleMapPagesss({super.key});

//   @override
//   State<GoogleMapPagesss> createState() => _GoogleMapPagesssState();
// }

// class _GoogleMapPagesssState extends State<GoogleMapPagesss> {
//   late GoogleMapController mapController;

//   final LatLng _center = LatLng(26.44849640299973, 87.27846932037666);

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Future<void> _saveName() async {
//       final prefs = await SharedPreferences.getInstance();
//       prefs.setString(location, _center.toString());
//     }

//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Maps Sample App'),
//       //   backgroundColor: Colors.green[700],
//       // ),
//       body: GoogleMap(
//         // mapType: MapType.hybrid,
//         markers: {
//           Marker(
//             markerId: MarkerId("destination"),
//             position: _center,
//           ),
//         },
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _center,
//           zoom: 18.0,
//         ),
//       ),
//     );
//   }
// }
