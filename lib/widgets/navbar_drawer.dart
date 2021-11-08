import 'package:galileo_hack_environment/utilities/asset_paths.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  Navbar({this.title = "Home"});

  final double _prefferedHeight = 180.0;

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  String activeTag;


  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.menu,
                  color: UIThemeColors.PRIMARY_COLOR,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }),
            Container(
                height: 25.0, child: Image.asset(ImagePath.ELEVATE_LOGO1)),
            IconButton(
              icon: Icon(
                FontAwesome.bell,
                color: UIThemeColors.PRIMARY_COLOR,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
