import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  static final routeName = "/map_page";

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _initialCameraPosition = LatLng(20.5937, 78.9629);
  Location _location = Location();

  void _onMapCreated(GoogleMapController _mapController) {
    _mapController = _mapController;
    _location.onLocationChanged.listen((l) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  CameraPosition _currentPosition;

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _initialCameraPosition),
        mapType: MapType.hybrid,
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
      ),
    );
  }
}
