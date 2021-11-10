import 'package:flutter/material.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';

class MapScreen extends StatefulWidget {
  static final routeName = "/map_page";

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Container(

        ),
      ),
    );
  }
}

