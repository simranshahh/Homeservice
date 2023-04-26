// // ignore_for_file: prefer_const_constructors, file_names, avoid_function_literals_in_foreach_calls

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:location/location.dart';

// class GoogleMapPage extends ConsumerStatefulWidget {
//   const GoogleMapPage({Key? key}) : super(key: key);
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _GoogleMapPageState();
// }

// class _GoogleMapPageState extends ConsumerState<GoogleMapPage> {
//   final Completer<GoogleMapController> _controller = Completer();
//   // static const LatLng sourceLocation = LatLng(26.473249, 87.283978);
//   // static const LatLng destination =
//   //     LatLng(26.454536729402893, 87.27967281090518);
//   // double distance = 0.0;
//   List<LatLng> polylineCoordinates = [];
//   // void getPolyPoints() async {
//   //   PolylinePoints polylinePoints = PolylinePoints();
//   //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//   //     google_api_key, // Your Google Map Key
//   //     PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
//   //     PointLatLng(destination.latitude, destination.longitude),
//   //   );
//   // if (result.points.isNotEmpty) {
//   //   result.points.forEach(
//   //     (PointLatLng point) => polylineCoordinates.add(
//   //       LatLng(point.latitude, point.longitude),
//   //     ),
//   //   );
//   //   setState(() {});
//   // }
//   //polulineCoordinates is the List of longitute and latidtude.
//   // double totalDistance = 0;
//   // for (var i = 0; i < polylineCoordinates.length - 1; i++) {
//   //   totalDistance += calculateDistance(
//   //       polylineCoordinates[i].latitude,
//   //       polylineCoordinates[i].longitude,
//   //       polylineCoordinates[i + 1].latitude,
//   //       polylineCoordinates[i + 1].longitude);
//   // }
//   // print(totalDistance);

//   // setState(() {
//   //   distance = totalDistance;
//   // });

//   //add to the list of poly line coordinates
//   // }

//   // double calculateDistance(lat1, lon1, lat2, lon2) {
//   //   var p = 0.017453292519943295;
//   //   var a = 0.5 -
//   //       cos((lat2 - lat1) * p) / 2 +
//   //       cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
//   //   return 12742 * asin(sqrt(a));
//   // }
//   final Location location = Location();

//   PermissionStatus? _permissionGranted;

//   Future<void> _checkPermissions() async {
//     final PermissionStatus permissionGrantedResult =
//         await location.hasPermission();
//     setState(() {
//       _permissionGranted = permissionGrantedResult;
//     });
//   }

//   Future<void> _requestPermission() async {
//     if (_permissionGranted != PermissionStatus.granted) {
//       final PermissionStatus permissionRequestedResult =
//           await location.requestPermission();
//       setState(() {
//         _permissionGranted = permissionRequestedResult;
//       });
//     }
//   }

//   void getCurrentLocation() async {
//     Location location = Location();
//     location.getLocation().then(
//       (location) {
//         ref.read(locationStateProvider.notifier).setLocation(location);
//         print('location: $location');
//       },
//     );

//     // bool _serviceEnabled;
//     // PermissionStatus _permissionGranted;
//     // LocationData _locationData;

//     // _serviceEnabled = await location.serviceEnabled();
//     // if (!_serviceEnabled) {
//     //   _serviceEnabled = await location.requestService();
//     //   if (!_serviceEnabled) {
//     //     return;
//     //   }
//     // }

//     // _permissionGranted = await location.hasPermission();
//     // if (_permissionGranted == PermissionStatus.denied) {
//     //   _permissionGranted = await location.requestPermission();
//     //   if (_permissionGranted != PermissionStatus.granted) {
//     //     return;
//     //   }
//     // }

//     // _locationData = await location.getLocation();

//     GoogleMapController googleMapController = await _controller.future;
//     location.onLocationChanged.listen(
//       (newLoc) {
//         ref.read(locationStateProvider.notifier).setLocation(newLoc);
//         googleMapController.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(
//               zoom: 18,
//               target: LatLng(
//                 newLoc.latitude!,
//                 newLoc.longitude!,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
//   // void setCustomMarkerIcon() {
//   //   BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/pin.png")
//   //       .then(
//   //     (icon) {
//   //       sourceIcon = icon;
//   //     },
//   //   );
//   //   BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/pin.png")
//   //       .then(
//   //     (icon) {
//   //       destinationIcon = icon;
//   //     },
//   //   );
//   //   BitmapDescriptor.hueBlue;
//   // }

//   // @override
//   // void didChangeDependencies() {
//   //   // Provider.of<>(context)
//   //   getCurrentLocation();
//   //   super.didChangeDependencies();
//   // }
//   @override
//   void initState() {
//     // getPolyPoints();
//     _requestPermission();
//     _checkPermissions();
//     getCurrentLocation();
//     super.initState();
//   }

//   Marker? currentMArker;
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     // final width = MediaQuery.of(context).size.width;
//     final location = ref.watch(locationStateProvider);
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(),
//         body: Column(children: [
//           location.currentLocation == null
//               ? SizedBox(
//                   height: height * 0.6,
//                   child: Center(
//                       child: Text(
//                     'Permission status: ${_permissionGranted ?? "unknown"}',
//                   )))
//               : SizedBox(
//                   height: height * 0.6,
//                   child: GoogleMap(
//                     initialCameraPosition: CameraPosition(
//                       target: LatLng(location.currentLocation!.latitude!,
//                           location.currentLocation!.longitude!),
//                       zoom: 13.5,
//                     ),
//                     markers: {
//                       Marker(
//                         markerId: const MarkerId("currentLocation"),
//                         icon: currentLocationIcon,
//                         position: LatLng(location.currentLocation!.latitude!,
//                             location.currentLocation!.longitude!),
//                       ),
//                       // Marker(
//                       //   markerId: const MarkerId("source"),
//                       //   icon: sourceIcon,
//                       //   position: sourceLocation,
//                       // ),
//                       // Marker(
//                       //   markerId: MarkerId("destination"),
//                       //   icon: destinationIcon,
//                       //   position: destination,
//                       // ),
//                     },
//                     onMapCreated: (mapController) {
//                       _controller.complete(mapController);
//                     },
//                     polylines: {
//                       Polyline(
//                         polylineId: const PolylineId("route"),
//                         points: polylineCoordinates,
//                         color: const Color(0xFF7B61FF),
//                         width: 6,
//                       ),
//                     },
//                   ),
//                 ),
//           location.currentLocation != null
//               ? Text(
//                   "${location.currentLocation!.latitude.toString()},${location.currentLocation!.longitude.toString()}")
//               : SizedBox(
//                   height: 0,
//                 )
//         ]));
//   }
// }

// class LocationState extends ChangeNotifier {
//   LocationData? currentLocation;
//   setLocation(LocationData location) {
//     currentLocation = location;
//     notifyListeners();
//   }

//   getLocation() {
//     return currentLocation;
//   }
// }

// final locationStateProvider =
//     ChangeNotifierProvider<LocationState>((ref) => LocationState());
