import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:galileo_hack_environment/utilities/asset_paths.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:galileo_hack_environment/widgets/drawer_tile.dart';

class NowDrawer extends StatelessWidget {
  final String currentPage;

  NowDrawer({this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          color: Colors.white,
          child: Column(children: [
            /*Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.1,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.85,
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Container(
                            child: Image.asset(ImagePath.IVOLUNTEER_LOGO1)),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: IconButton(
                              icon: Icon(Icons.menu,
                                  color: UIThemeColors.PRIMARY_COLOR,
                                  size: 24.0),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                      ],
                    ),
                  ),
                )),*/
            UserAccountsDrawerHeader(
                currentAccountPicture: Image.asset(ImagePath.MALE_ICON1),
                accountName: Text("John Doe"),
                accountEmail: Text("johndoe@gmail.com")),


            Expanded(
              flex: 2,
              child: ListView(
                padding: EdgeInsets.only(top: 36, left: 8, right: 16),
                children: [
                  DrawerTile(
                      icon: FontAwesomeIcons.home,
                      onTap: () {
                        if (currentPage != "Home"){}
                        /*Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);*/
                      },
                      iconColor: UIThemeColors.primary,
                      title: "Home",
                      isSelected: currentPage == "Home" ? true : false),
                  DrawerTile(
                      icon: FontAwesomeIcons.user,
                      onTap: () {
                        if (currentPage != "Profile") {}


                        /*Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);*/
                        /*Navigator.pushReplacementNamed(
                        context, ProfileScreen.routeName);*/
                      },
                      iconColor: UIThemeColors.warning,
                      title: "Profile",
                      isSelected: currentPage == "Profile" ? true : false),

                  DrawerTile(
                      icon: FontAwesomeIcons.search,
                      onTap: () {
                        //if (currentPage != "Find Volunteer")
                        /*Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    Navigator.pushReplacementNamed(
                        context, ProfileScreen.routeName);*/

                      },
                      iconColor: UIThemeColors.warning,
                      title: "FindVolunteer",
                      isSelected: currentPage == "FindVolunteer"
                          ? true
                          : false),
                  DrawerTile(
                      icon: FontAwesomeIcons.signOutAlt,
                      onTap: () {
                        /*Navigator.pushReplacementNamed(context, LoginScreen.routeName);*/
                      },
                      iconColor: UIThemeColors.warning,
                      title: "Logout",
                      isSelected: currentPage == "Logout" ? true : false),
                  DrawerTile(
                      icon: FontAwesomeIcons.fileInvoice,
                      onTap: () {
                        if (currentPage != "Opportunity") {}
                        /*Navigator.pushReplacementNamed(
                          context, PostOpportunityScreen.routeName);*/
                      },
                      iconColor: UIThemeColors.info,
                      title: "Opportunity",
                      isSelected: currentPage == "Opportunity" ? true : false),

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
                      Divider(
                          height: 4,
                          thickness: 0,
                          color: UIThemeColors.PRIMARY_COLOR),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
                        child: Text("DOCUMENTATION",
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
