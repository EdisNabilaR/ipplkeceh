// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';

// class Peta extends StatefulWidget {
//   @override
//   _PetaState createState() => _PetaState();
// }

// class _PetaState extends State<Peta> {
//   late GoogleMapController mapController;
//   final LatLng _center = const LatLng(-1.1495817, 116.8604358);

//   Set<Marker> _markers = {};
//   List<LatLng> _selectedLocations = [];

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   void _addMarker(LatLng position) async {
//     final String markerIdValue = DateTime.now().millisecondsSinceEpoch.toString();
//     final MarkerId markerId = MarkerId(markerIdValue);

//     // Mendapatkan nama lokasi berdasarkan koordinat
//     List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
//     String locationName = placemarks.isNotEmpty ? placemarks[0].name ?? '' : '';

//     setState(() {
//       _markers.add(
//         Marker(
//           markerId: markerId,
//           position: position,
//           infoWindow: InfoWindow(
//             title: 'Custom Marker $markerIdValue',
//             snippet: 'Deskripsi Marker $markerIdValue',
//           ),
//           icon: BitmapDescriptor.defaultMarker,
//         ),
//       );

//       _selectedLocations.add(position);
//     });

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Lokasi Dipilih'),
//           content: Text('Nama Lokasi: $locationName\nKoordinat: $position'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Maps Sample App'),
//         backgroundColor: Colors.green[700],
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _center,
//           zoom: 15.0,
//         ),
//         markers: _markers,
//         onTap: (LatLng position) {
//           _addMarker(position);
//         },
//       ),
//     );
//   }
// }
