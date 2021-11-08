
import 'package:galileo_hack_environment/utilities/common.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:galileo_hack_environment/utilities/asset_paths.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:galileo_hack_environment/widgets/drawer_tile.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';

class NowDrawer extends StatelessWidget {
  final String currentPage;

  NowDrawer({this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: UIThemeColors.WHITE_COLOR1,
      child: Column(children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: Image.asset(ImagePath.MALE_ICON1),
          accountName: Text(
            "",
            style: TextStyle(
              color: UIThemeColors.WHITE_COLOR1,
              fontSize: 12.0,
            ),
          ),
          accountEmail: Text(
            "",
            style: TextStyle(
              color: UIThemeColors.WHITE_COLOR1,
              fontSize: 12.0,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ListView(
            padding: EdgeInsets.only(top: 36, left: 8, right: 16),
            children: [
              DrawerTile(
                icon: FontAwesomeIcons.home,
                onTap: () {},
                iconColor: UIThemeColors.PRIMARY_COLOR,
                title: "Home",
                isSelected: currentPage == "Home" ? true : false,
              ),
              DrawerTile(
                icon: FontAwesomeIcons.user,
                onTap: () {},
                iconColor: UIThemeColors.primary,
                title: "Profile",
                isSelected: currentPage == "Profile" ? true : false,
              ),
              DrawerTile(
                icon: FontAwesomeIcons.doorClosed,
                onTap: () {
                },
                iconColor: UIThemeColors.primary,
                title: "Logout",
                isSelected: currentPage == "Logout" ? true : false,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              padding: EdgeInsets.only(left: 8, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 4, thickness: 0, color: UIThemeColors.PRIMARY_COLOR),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
                    child: Text("Version " + CommonData.APP_VERSION,
                        style: TextStyle(
                          color: UIThemeColors.PRIMARY_COLOR,
                          fontSize: 13,
                        )),
                  ),
                ],
              )),
        ),
      ]),
    ));
  }
}
