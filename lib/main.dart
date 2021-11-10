import 'package:flutter/material.dart';
import 'package:galileo_hack_environment/screens/home/home_screen.dart';
import 'package:galileo_hack_environment/screens/home/pages/donation_page_screen.dart';
import 'package:galileo_hack_environment/screens/home/pages/feed_page_screen.dart';
import 'package:galileo_hack_environment/screens/login/login_screen.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: UIThemeColors.PRIMARY_COLOR,
        fontFamily: UIFontStyles.MONTSERRAT_REGULAR,
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        DonationPageScreen.routeName: (context) => DonationPageScreen(),
        FeedPageScreen.routeName: (context) => FeedPageScreen(),
      },
    );
  }
}

