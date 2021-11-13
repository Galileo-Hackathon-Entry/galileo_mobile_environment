import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:galileo_hack_environment/screens/community_view/home/pages/donation/donate_screen.dart';
import 'package:galileo_hack_environment/utilities/asset_paths.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DonationPageScreen extends StatefulWidget {
  static final routeName = "/donation_page_screen";

  @override
  _DonationPageScreenState createState() => _DonationPageScreenState();
}

class _DonationPageScreenState extends State<DonationPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "DONATION",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: UIThemeColors.PRIMARY_COLOR,
                ),
              ),
            ),
            _CardDonation(
              organization: "Green Peace",
              material: "Plastic Bottles",
              imagePath: ImagePath.PLASTIC_BOTTLE_PIC1,
              contactPerson: "Daryll Duran",
              description: "Plastic bottles to be converted in chair.",
              statusInformation: "700 out of 1000 remaining.",
              date: "Nov 1, 2021 to Nov 20, 2021",
              percent: 0.30,
              funcDonate: (){
                Navigator.pushNamed(context, DonateScreen.routeName);
              },
            ),
            _CardDonation(
              organization: "DENR",
              material: "Cans",
              imagePath: ImagePath.CANS_PIC1,
              contactPerson: "Arriance Santiago",
              description: "Cans will be reuse",
              statusInformation: "500 out of 1000 remaining.",
              date: "Nov 20, 2021 to Dec 1, 2021",
              percent: 0.50,
              funcDonate: (){},
            ),
            _CardDonation(
              organization: "Bazura Bags",
              material: "Juice Containers",
              imagePath: ImagePath.JUICE_CONTAINER_PIC1,
              contactPerson: "Querunbin Arnaldo",
              description: "Juice Container will be converted into reusable bags.",
              statusInformation: "400 out of 2000 remaining.",
              date: "Dec 1, 2021 to Dec 31, 2021",
              percent: 0.80,
              funcDonate: (){},
            ),
          ],
        ),
      ),
    );
  }
}

class _CardDonation extends StatelessWidget {
  final String imagePath;
  final String material;
  final String organization;
  final double percent;
  final String date;
  final String contactPerson;
  final String description;
  final String statusInformation;
  final Function funcDonate;

  _CardDonation({
    this.imagePath = ImagePath.PLASTIC_BOTTLE_PIC1,
    this.material = "",
    this.organization = "",
    this.percent = 0.0,
    this.date = "",
    this.contactPerson = "",
    this.description = "",
    this.statusInformation = "",
    this.funcDonate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 5.0,
        child: Container(
          color: Colors.grey[200],
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagePath),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        organization,
                        style: TextStyle(
                          color: UIThemeColors.PRIMARY_COLOR,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        material,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(FontAwesome.calendar, color: UIThemeColors.PRIMARY_COLOR),
                        SizedBox(width: 10.0),
                        Text(date)
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Icon(Icons.person, color: UIThemeColors.PRIMARY_COLOR),
                        SizedBox(width: 10.0),
                        Text(contactPerson),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Icon(Icons.info, color: UIThemeColors.PRIMARY_COLOR),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text(
                            description,
                            //textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearPercentIndicator(
                          width: 200,
                          animation: true,
                          lineHeight: 20.0,
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
                    SizedBox(height: 10.0),
                    Text(statusInformation),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlatButton(
                          onPressed: (){},
                          child: Text(
                            "View Details",
                            style: TextStyle(fontSize: 13.0, color: Theme.of(context).primaryColor, fontStyle: FontStyle.italic),
                          ),
                        ),
                        ElevatedButton(onPressed: () => funcDonate(), child: Text("Donate"),
                          style: ElevatedButton.styleFrom(
                            primary: UIThemeColors.PRIMARY_COLOR,
                            onPrimary: Colors.white,
                            onSurface: Colors.grey,
                          ),),
                      ],
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
