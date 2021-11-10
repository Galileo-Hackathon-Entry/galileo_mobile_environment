import 'package:flutter/material.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';

class FeedPageScreen extends StatefulWidget {
  static final routeName = "/feed_page_screen";

  @override
  _FeedPageScreenState createState() => _FeedPageScreenState();
}

class _FeedPageScreenState extends State<FeedPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: Center(
          child: Text("FEED SCREEN"),
      ),
    );
  }
}

