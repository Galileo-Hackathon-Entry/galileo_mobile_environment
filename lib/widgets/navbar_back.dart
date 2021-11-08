import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:flutter/material.dart';

class NavbarBack extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  NavbarBack({this.title = ""});

  final double _prefferedHeight = 180.0;

  @override
  _NavbarBackState createState() => _NavbarBackState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarBackState extends State<NavbarBack> {
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
          color: UIThemeColors.WHITE_COLOR1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: UIThemeColors.PRIMARY_COLOR,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: UIThemeColors.PRIMARY_COLOR,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
