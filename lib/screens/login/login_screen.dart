import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galileo_hack_environment/screens/community_view/home/home_screen.dart';
import 'package:galileo_hack_environment/screens/signup/signup_screen.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:galileo_hack_environment/widgets/bezier_container.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static final routeName = "/login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _conUserName = TextEditingController();
  TextEditingController _conPassword = TextEditingController();
  bool _showPassword = false;
  var regDetails = {'email': '', 'password': ''};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    checkIfLoggedIn(context);

    Widget _backButton() {
      return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              ),
              Text('Back', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
            ],
          ),
        ),
      );
    }

    Widget _entryField(String title, String key, {bool isPassword = false}) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                onChanged: (value) {
                  regDetails[key] = value;
                },
                obscureText: isPassword, decoration: InputDecoration(border: InputBorder.none, fillColor: Color(0xfff3f3f4), filled: true))
          ],
        ),
      );
    }

    Widget _submitButton(context) {
      return new GestureDetector(
          onTap: () => {
            signIn(regDetails['email'], regDetails['password'], context)
          },
          child: new Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey.shade200, offset: Offset(2, 4), blurRadius: 5, spreadRadius: 2)],
                gradient: LinearGradient(
                    begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Colors.green[500], Colors.green[800]])),
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ));
    }

    Widget _divider() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ),
            Text('or'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      );
    }

    Widget _facebookButton() {
      return Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff1959a9),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('f', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2872ba),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(5), topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Log in with Facebook', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      );
    }

    Widget _createAccountLabel() {
      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: EdgeInsets.all(15),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Don\'t have an account ?',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Register',
                style: TextStyle(color: Colors.green[500], fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      );
    }

    Widget _title() {
      return Container(
          //height: 60.0,
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Text("T", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: UIThemeColors.PRIMARY_COLOR),),
          Text(
            "Trash",
            style: TextStyle(
              fontFamily: UIFontStyles.MONTSERRAT_BOLD,
              fontWeight: FontWeight.w900,
              fontSize: 30.0,
              color: Colors.black,
            ),
          ),
          Text(
            "Connect",
            style: TextStyle(
              fontFamily: UIFontStyles.MONTSERRAT_BOLD,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: UIThemeColors.PRIMARY_COLOR,
            ),
          ),
        ],
      ));
    }

    Widget _emailPasswordWidget() {
      return Column(
        children: <Widget>[
          _entryField("Email", 'email'),
          _entryField("Password", 'password', isPassword: true),
        ],
      );
    }

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child:Stack(
        children: <Widget>[
          Positioned(top: -height * .15, right: -MediaQuery.of(context).size.width * .4, child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 40),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(context),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password ?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  _divider(),
                  _facebookButton(),
                  SizedBox(height: height * .055),
                  _createAccountLabel(),
                ],
              ),
            ),
          ),
          //Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}

class CreateaccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator CreateaccountWidget - FRAME
    return Container(
        width: double.infinity,
        //height: 896,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(children: <Widget>[
          //Positioned(top: 861.995849609375, left: 0, child: null),
          /*Positioned(
              top: 44,
              left: 0,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    *//*Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                         // null,
                        ],
                      ),
                    ),*//*
                  ],
                ),
              )),*/
          //Positioned(top: 0, left: 0, child: null),
          Positioned(
              top: 100,
              left: 0,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          //null,
                          SizedBox(height: 0),
                          Text(
                            'Create an account to connect and startrecycling today.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(47, 72, 88, 1),
                                fontFamily: 'SF Pro Text',
                                fontSize: 16,
                                letterSpacing: -0.3199999928474426,
                                fontWeight: FontWeight.normal,
                                height: 1.3125),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(),
                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(),
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Email or Mobile Number',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(58, 58, 60, 1),
                                            fontFamily: 'SF Pro Text',
                                            fontSize: 13,
                                            letterSpacing: -0.07800000160932541,
                                            fontWeight: FontWeight.normal,
                                            height: 1.3846153846153846),
                                      ),
                                      SizedBox(height: 4),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          border: Border.all(
                                            color: Color.fromRGBO(216, 216, 220, 1),
                                            width: 1,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'example@email.com',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(174, 174, 178, 1),
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 17,
                                                  letterSpacing: -0.40799999237060547,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1.2941176470588236),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  decoration: BoxDecoration(),
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Password',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(58, 58, 60, 1),
                                            fontFamily: 'SF Pro Text',
                                            fontSize: 13,
                                            letterSpacing: -0.07800000160932541,
                                            fontWeight: FontWeight.normal,
                                            height: 1.3846153846153846),
                                      ),
                                      SizedBox(height: 4),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          border: Border.all(
                                            color: Color.fromRGBO(216, 216, 220, 1),
                                            width: 1,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Placeholder',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color.fromRGBO(174, 174, 178, 1),
                                                  fontFamily: 'SF Pro Text',
                                                  fontSize: 17,
                                                  letterSpacing: -0.40799999237060547,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1.2941176470588236),
                                            ),
                                            SizedBox(width: 10),
                                            Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                ),
                                                child: Stack(children: <Widget>[
                                                  Positioned(
                                                      top: 5,
                                                      left: 2.3871960639953613,
                                                      child: Container(
                                                          width: 19.225303649902344,
                                                          height: 14,
                                                          child: Stack(children: <Widget>[
                                                            Positioned(
                                                              top: 0,
                                                              left: 0,
                                                              child: SvgPicture.asset('assets/images/vector.svg', semanticsLabel: 'vector'),
                                                            ),
                                                            Positioned(
                                                              top: 4,
                                                              left: 6.612803936004639,
                                                              child: SvgPicture.asset('assets/images/vector.svg', semanticsLabel: 'vector'),
                                                            ),
                                                          ]))),
                                                ])),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(),
                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(14),
                                      topRight: Radius.circular(14),
                                      bottomLeft: Radius.circular(14),
                                      bottomRight: Radius.circular(14),
                                    ),
                                    color: Color.fromRGBO(1, 130, 86, 1),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Next',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontFamily: 'SF Pro Text',
                                            fontSize: 17,
                                            letterSpacing: -0.40799999237060547,
                                            fontWeight: FontWeight.normal,
                                            height: 1.2941176470588236),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              top: 490.65045166015625,
              left: 16,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Divider(color: Color.fromRGBO(209, 209, 214, 1), thickness: 1),
                    SizedBox(width: 9),
                    Text(
                      'Or ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(47, 72, 88, 1),
                          fontFamily: 'SF Pro Text',
                          fontSize: 13,
                          letterSpacing: -0.07800000160932541,
                          fontWeight: FontWeight.normal,
                          height: 1.3846153846153846),
                    ),
                    SizedBox(width: 9),
                    Divider(color: Color.fromRGBO(209, 209, 214, 1), thickness: 1),
                  ],
                ),
              )),
          Positioned(
              top: 532.6504516601562,
              left: 0,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14),
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14),
                              ),
                              color: Color.fromRGBO(28, 28, 30, 1),
                              border: Border.all(
                                color: Color.fromRGBO(25, 118, 210, 1),
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    child: Stack(children: <Widget>[
                                      Positioned(
                                          top: -0.000010519380339246709,
                                          left: 2.2501111030578613,
                                          child: Container(
                                              width: 19.49995231628418,
                                              height: 24.0001220703125,
                                              child: Stack(children: <Widget>[
                                                Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: SvgPicture.asset('assets/images/vector.svg', semanticsLabel: 'vector'),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: SvgPicture.asset('assets/images/vector.svg', semanticsLabel: 'vector'),
                                                ),
                                              ]))),
                                    ])),
                                SizedBox(width: 10),
                                Text(
                                  'Sign Up with Apple',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 17,
                                      letterSpacing: -0.40799999237060547,
                                      fontWeight: FontWeight.normal,
                                      height: 1.2941176470588236),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14),
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14),
                              ),
                              color: Color.fromRGBO(255, 255, 255, 1),
                              border: Border.all(
                                color: Color.fromRGBO(25, 118, 210, 1),
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    child: Stack(children: <Widget>[
                                      Positioned(
                                        top: 2,
                                        left: 2,
                                        child: SvgPicture.asset('assets/images/vector.svg', semanticsLabel: 'vector'),
                                      ),
                                      Positioned(
                                        top: 2,
                                        left: 3.1530001163482666,
                                        child: SvgPicture.asset('assets/images/vector.svg', semanticsLabel: 'vector'),
                                      ),
                                      Positioned(
                                        top: 14.027000427246094,
                                        left: 3.0975000858306885,
                                        child: SvgPicture.asset('assets/images/vector.svg', semanticsLabel: 'vector'),
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 12,
                                        child: SvgPicture.asset('assets/images/vector.svg', semanticsLabel: 'vector'),
                                      ),
                                    ])),
                                SizedBox(width: 10),
                                Text(
                                  'Sign Up with Google',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(25, 118, 210, 1),
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 17,
                                      letterSpacing: -0.40799999237060547,
                                      fontWeight: FontWeight.normal,
                                      height: 1.2941176470588236),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14),
                                topRight: Radius.circular(14),
                                bottomLeft: Radius.circular(14),
                                bottomRight: Radius.circular(14),
                              ),
                              color: Color.fromRGBO(25, 118, 210, 1),
                              border: Border.all(
                                color: Color.fromRGBO(25, 118, 210, 1),
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(27, 118, 242, 1),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      SvgPicture.asset('assets/images/vector.svg', semanticsLabel: 'vector'),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Sign Up with Facebook',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 17,
                                      letterSpacing: -0.40799999237060547,
                                      fontWeight: FontWeight.normal,
                                      height: 1.2941176470588236),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ]));
  }
}

class _ButtonLogin extends StatelessWidget {
  final Function function;

  _ButtonLogin({this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Theme.of(context).primaryColor),
        ),
        onPressed: () => function(),
        padding: EdgeInsets.all(10.0),
        color: Theme.of(context).primaryColor,
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            // fontStyle: "monserrat_regular",
          ),
        ),
      ),
    );
  }
}

class _TextInputUserName extends StatelessWidget {
  final TextEditingController controller;

  _TextInputUserName({this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 5.0),
          child: Text(
            "Username",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        Card(
          elevation: 5.0,
          color: Colors.green[200],
          child: TextFormField(
            controller: controller,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              fillColor: Colors.red,
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              //hintText: "Enter your Username",
              hintStyle: TextStyle(
                color: Colors.grey[100],
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TextInputPassword extends StatelessWidget {
  final TextEditingController controller;
  final bool showPassword;
  final Function funcShowPassword;

  _TextInputPassword({this.controller, this.showPassword = false, this.funcShowPassword});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 5.0),
          child: Text(
            "Password",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        Card(
          elevation: 5.0,
          color: Colors.green[200],
          child: TextFormField(
            obscureText: !showPassword,
            controller: controller,
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(20),
            ],
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              fillColor: Colors.green,
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                color: Colors.white,
                onPressed: () => funcShowPassword(),
                icon: showPassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
              ),
              //hintText: "Enter your Username",
              hintStyle: TextStyle(
                color: Colors.grey[100],
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TextInput extends StatelessWidget {
  final String placeholder;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final Function onTap;
  final Function onChanged;
  final TextEditingController controller;
  final bool autofocus;
  final Color borderColor;

  _TextInput(
      {this.placeholder,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.onChanged,
      this.autofocus = false,
      this.borderColor = Colors.grey,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: Colors.grey,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        autofocus: autofocus,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.grey,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: borderColor, width: 1.0, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: borderColor, width: 1.0, style: BorderStyle.solid)),
            hintText: placeholder));
  }
}


signIn (username, password, context) async {
  var server = Uri.parse('http://10.0.2.2:3001/api/user/auth');
  final http.Response response = await http.post(server, headers: <String, String> {
    'Content-Type' : 'application/json; charset=UTF-8'
  },
  body: jsonEncode(<String, String>{
    'email' : username,
    'password': password
  }));

  //please check the returned value, add alert dailog
  var data = jsonDecode(response.body);

  if(data['success'].toString() == 'true') {
    print(data['user']['id']);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', data['token']);
    prefs.setString('user_id', data['user']['id']);
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }
}

checkIfLoggedIn (context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString("token").isNotEmpty) {
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }
}