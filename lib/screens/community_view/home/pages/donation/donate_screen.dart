import 'dart:io';

import 'package:flutter/material.dart';
import 'package:galileo_hack_environment/utilities/asset_paths.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:galileo_hack_environment/widgets/navbar_back.dart';

class DonateScreen extends StatefulWidget {
  static final routeName = "/donate_screen";

  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NavbarBack(
          title: "Donate",
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.0),
                        SizedBox(
                          child: Text(
                            "Donation Details",
                            style:
                                TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor, fontFamily: UIFontStyles.MONTSERRAT_BOLD),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        _CustomTextField(
                          labelText: "Company Name",
                          initialValue: "Green Peace",
                        ),
                        SizedBox(height: 10.0),
                        _CustomTextField(
                          labelText: "Material",
                          initialValue: "Plastic Bottles",
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: _CustomTextField(
                                labelText: "Minimum",
                                initialValue: "50",
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              flex: 3,
                              child: _CustomTextField(
                                labelText: "Count",
                                initialValue: "50",
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            )
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Proof",
                          style: TextStyle(
                            color: UIThemeColors.PRIMARY_COLOR,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _UploadPhoto(
                          optionSelect: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                      width: double.infinity,
                      child: RaisedButton(
                        color: UIThemeColors.PRIMARY_COLOR,
                        onPressed: () {},
                        child: Text(
                          "DONATE",
                          style: TextStyle(color: Colors.white, fontSize: 17.0),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}

class _UploadPhoto extends StatelessWidget {
  final String labelText;
  final String iconPath;
  final int optionSelect;
  final Function funcCamera;
  final Function funcUpload;
  final Function funcPopUp;
  final File image;
  final bool isValid;

  final bool showButton;
  final String labelPopup;
  final String bottomLabel;

  _UploadPhoto({
    this.labelText = "",
    this.iconPath = ImagePath.PLASTIC_BOTTLE_PIC1,
    this.optionSelect = 1,
    this.funcCamera,
    this.funcUpload,
    this.image,
    this.isValid = true,
    this.showButton = false,
    this.funcPopUp,
    this.labelPopup = "",
    this.bottomLabel = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: isValid ? Colors.grey[400] : Colors.red),
            borderRadius: BorderRadius.circular(3.0),
          ),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(labelText),
                    Visibility(
                      visible: showButton,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          // minimumSize: Size(88, 44),
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red),
                          ),
                        ),
                        onPressed: () => funcPopUp(),
                        child: Text(
                          labelPopup,
                          style: TextStyle(color: UIThemeColors.PRIMARY_COLOR),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              image == null
                  ? Container(width: 120.0, height: 120.0, child: Image.asset(iconPath))
                  : /*AspectRatio(aspectRatio: 16 / 9, child: Image.file(image)),*/ Container(
                      width: double.infinity, child: Image.file(image)),
              bottomLabel.isEmpty
                  ? Container()
                  : Text(
                      bottomLabel,
                      style: TextStyle(fontSize: 13.0),
                      textAlign: TextAlign.center,
                    ),
              optionSelect == 1
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            //  minimumSize: Size(_width, _height),
                            backgroundColor: Colors.yellow,
                            padding: EdgeInsets.all(10.0),
                          ),
                          //color: Colors.yellow,
                          child: Text("Upload", style: TextStyle(color: Colors.black)),
                          onPressed: () => funcUpload(),
                        ),
                        SizedBox(width: 15.0),
                        TextButton(
                          style: TextButton.styleFrom(
                            //  minimumSize: Size(_width, _height),
                            backgroundColor: Colors.yellow,
                            padding: EdgeInsets.all(10.0),
                          ),
                          child: Text("Camera", style: TextStyle(color: Colors.black)),
                          onPressed: () => funcCamera(),
                        ),
                      ],
                    )
            ],
          ),
        ),
        Visibility(
          maintainSize: false,
          visible: !isValid,
          child: Container(
              padding: EdgeInsets.only(left: 10.0, top: 7.0),
              child: Text("Photo is Required.", style: TextStyle(color: Colors.red, fontSize: 12.0))),
        )
      ],
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final labelText;
  final String initialValue;

  _CustomTextField({this.labelText = "", this.initialValue = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: false,
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: labelText,
          // errorText: 'Error message',
          border: OutlineInputBorder(),
          // suffixIcon: Icon(
          //   Icons.error,
          // ),
        ),
      ),
    );
  }
}
