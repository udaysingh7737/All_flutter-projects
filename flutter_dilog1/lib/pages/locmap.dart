import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  StreamSubscription _locationSubsciption;
  Location _locationTracker = Location();
   GoogleMapController _controller;
   Marker marker;
   Circle circle;

   static final CameraPosition initialLocation = CameraPosition(
       target: LatLng(25.2138 , 75.8648),
       zoom: 11.5
   );

   
   Future<Uint8List> getMarker() async{
     ByteData byteData = await DefaultAssetBundle.of(context).load('assets/images/loc1.png');
     return byteData.buffer.asUint8List();
   }

   void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData){
     LatLng latLng = LatLng(newLocalData.latitude, newLocalData.longitude);
     this.setState(() {
       marker = Marker(
         markerId: MarkerId("home"),
         position: latLng,
         rotation: newLocalData.heading,
         draggable: false,
         zIndex: 2,
         flat: true,
         //anchor: Offset(0.5,0.5),
         icon: BitmapDescriptor.fromBytes(imageData)
       );

       circle = Circle(
         circleId: CircleId('men'),
         radius: newLocalData.accuracy,
         zIndex: 1,
         strokeColor: Colors.blueAccent,
         center: latLng,
         fillColor: Colors.blue.withAlpha(90),

       );
     });
   }


  void getCurrentLocation() async {
    try {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubsciption != null) {
        _locationSubsciption.cancel();
      }


      _locationSubsciption = _locationTracker.onLocationChanged.listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(newLocalData.latitude, newLocalData.longitude),
              tilt: 0,
              zoom: 19.00)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),

      body:  Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          // googleMap
          child: GoogleMap(
            mapType: MapType.hybrid,
            onMapCreated: (GoogleMapController controller){
              _controller = controller;
            },
            initialCameraPosition: initialLocation,

            markers: Set.of((marker !=null) ? [marker] : []),
            circles: Set.of((circle != null) ? [circle] : []),
          ),


        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching_rounded),
        onPressed: getCurrentLocation,
      ),
    );
  }
}
