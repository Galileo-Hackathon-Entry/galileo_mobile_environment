import 'package:flutter/material.dart';
import 'package:galileo_hack_environment/utilities/asset_paths.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TopContributorPageScreen extends StatefulWidget {
  static final routeName = "/top_contributors_page_screen";

  @override
  _TopContributorPageScreenState createState() => _TopContributorPageScreenState();
}

class _TopContributorPageScreenState extends State<TopContributorPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Container(
          // padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 5.0,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      children: [
                        Text(
                          "Total Donations",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: UIThemeColors.PRIMARY_COLOR),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(flex: 1, child: Text("Platic Bottles: ")),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "1051",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: UIThemeColors.PRIMARY_COLOR),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 1, child: Text("Empty Cans: ")),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "2051",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: UIThemeColors.PRIMARY_COLOR),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(flex: 1, child: Text("Others: ")),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "6051",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: UIThemeColors.PRIMARY_COLOR),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                _CardContributor(
                  imagePath: ImagePath.JOHNREV_PIC1,
                  name: "John Rev Puno",
                  points: "1230 pts",
                  percent: 0.8,
                  isMedalShow: true,
                ),
                _CardContributor(
                  imagePath: ImagePath.ANTHONY_PIC1,
                  name: "Mark Estopace",
                  points: "5000 pts",
                  percent: 0.8,
                  isMedalShow: true,
                ),
                _CardContributor(
                  imagePath: ImagePath.DARYLL_PIC1,
                  name: "Daryll Ipsum",
                  points: "7580 pts",
                  percent: 0.9,
                  isMedalShow: true,
                ),
              ],
            ),
          ),
        ));
  }
}

class _CardContributor extends StatelessWidget {
  final String imagePath;
  final String name;
  final String points;
  final double percent;
  final bool isMedalShow;

  _CardContributor({
    this.imagePath = ImagePath.JOHNREV_PIC1,
    this.name = "",
    this.points = "",
    this.percent = 0.0,
    this.isMedalShow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 90.0,
                      height: 50.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: ClipRRect(
                          child: Image.asset(imagePath),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0, color: UIThemeColors.PRIMARY_COLOR),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          points,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Text("Exp: "),
                            LinearPercentIndicator(
                              padding: EdgeInsets.all(0.0),
                              width: 150,
                              animation: true,
                              lineHeight: 15.0,
                              animationDuration: 2500,
                              percent: percent,
                              center: Text(
                                "${(percent * 100).toStringAsFixed(1)}%",
                                style: TextStyle(color: Colors.white),
                              ),
                              linearStrokeCap: LinearStrokeCap.butt,
                              progressColor: UIThemeColors.PRIMARY_COLOR,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isMedalShow,
                      child: Image.asset(ImagePath.MEDAL_ICON1),
                    )
                  ],
                ),
                Text("")
              ],
            )
          ],
        ),
      ),
    );
  }
}
