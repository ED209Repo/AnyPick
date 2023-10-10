// import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// const LatLng destination= LatLng(32.5839, 71.5370);
// List<LatLng> polylineCoordinates=[];
// void getPolyPoints()async{
//   PolylinePoints polylinePoints= PolylinePoints();
//   PolylineResult result= await polylinePoints.getRouteBetweenCoordinates(google_api_key,
//       PointLatLng(destination.latitude, destination.longitude));
//   if (result.points.isNotEmpty){
//     result.points.forEach((PointLatLng point) => polylineCoordinates.add(point.latitude,point.longitude) { });
//     setState((){});
//   }
// }
// void getCurrentLocation(){
//   Location location=Location();
//   location.getLocation().then(
//       (location){
//         currentLocation=location;
//       },
//   );
//   location.onLocationChanged.listen(newLoc){
//     currentLocation = newLoc;
//     setState((){});
//   }
// }
// @override
// void initState(){
//   getPolyPoints();
//   super.initState();
// }
// class MapScreen extends StatefulWidget {
//   const MapScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;
//   final Map<String,Marker> _markers = {};
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: GoogleMap(
//         polylines: { Polyline(polylineId: PolylineId('route'),
//           points: polylineCoordinates,
//           color: Colors.blueAccent,
//           width: 6,
//         ),
//         },
//         initialCameraPosition: const CameraPosition(
//             target: destination,
//         zoom: 14,
//         ),
//         onMapCreated: (controller){
//           mapController = controller;
//           addMarker('test' , destination);
//         },
//         //markers
//         markers: _markers.values.toSet(
//         ),
//       ),
//     );
//   }
//   addMarker(String id,LatLng location) async
//   {
//     var markericon= await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'images/restaurant.png');
//     var  marker =  Marker(markerId: MarkerId(id),
//       position: location,
//       icon: markericon,
//     );
//     _markers[id]=marker;
//     setState(() {
//
//     });
//   }
// }
