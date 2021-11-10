import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:galileo_hack_environment/screens/home/pages/map.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:galileo_hack_environment/widgets/drawer.dart';
import 'package:galileo_hack_environment/widgets/navbar_drawer.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = "/home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  MapScreen _mapScreen = MapScreen();

  Widget _showPage(int page) {
    switch (page) {
      case 0:
        return _mapScreen;
        break;
      default:
        return Center(
          child: Text("Coming Soon..."),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: Navbar(
          title: "Home",
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          height: 50.0,
          index: 1,
          backgroundColor: UIThemeColors.PRIMARY_COLOR,
          items: <Widget>[
            Icon(FontAwesome.heart, color: UIThemeColors.PRIMARY_COLOR),
            Icon(FontAwesome.handshake_o, color: UIThemeColors.PRIMARY_COLOR),
            Icon(FontAwesome.group, color: UIThemeColors.PRIMARY_COLOR),
            Icon(FontAwesome.trophy, color: UIThemeColors.PRIMARY_COLOR),
            Icon(FontAwesome.building, color: UIThemeColors.PRIMARY_COLOR),
          ],
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
        ),
        drawer: NowDrawer(currentPage: "Home"),
        body: Container(child: _showPage(_pageIndex)));
  }
}
