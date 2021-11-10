import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:galileo_hack_environment/screens/home/home_screen.dart';
import 'package:galileo_hack_environment/utilities/asset_paths.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';

class LoginScreen extends StatefulWidget {
  static final routeName = "/login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _conUserName = TextEditingController();
  TextEditingController _conPassword = TextEditingController();
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        //color: Theme.of(context).primaryColor,
        child: SafeArea(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 200.0,
                  height: 200.0,
                  child: Image.asset(ImagePath.RECYCLE_ICON1)),
              // SizedBox(height: 20.0),
              Text(
                "CallAppBorate",
                style: TextStyle(
                    color: UIThemeColors.PRIMARY_COLOR,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20.0),
              Column(
                children: <Widget>[
                  /*_TextInputUserName(
                    controller: _conUserName,
                  ),
                  SizedBox(height: 20.0),
                  _TextInputPassword(
                    showPassword: _showPassword,
                    controller: _conPassword,
                    funcShowPassword: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),*/
                  _TextInput(
                    placeholder: "Username",
                    prefixIcon: Icon(Icons.person),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  _TextInput(
                    placeholder: "Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 10.0),
              _ButtonLogin(
                function: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
              ),
              SizedBox(height: 20.0),
              Container(
                child: FlatButton(
                  onPressed: () {
                    //  Navigator.of(context).pushNamed(RegisterScreen.routeName);
                  },
                  child: Text("Register", style: TextStyle(color: Colors.blue)),
                ),
              ),
              SizedBox(height: 10.0),
              SignInButton(
                Buttons.Google,
                onPressed: () {},
              ),
              SignInButton(
                Buttons.Facebook,
                onPressed: () {},
              ),
              SignInButton(
                Buttons.LinkedIn,
                onPressed: () {},
              ),
            ],
          ),
        )),
      ),
    );
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

  _TextInputPassword(
      {this.controller, this.showPassword = false, this.funcShowPassword});

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
                icon: showPassword
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
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
            contentPadding:
                EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                    color: borderColor, width: 1.0, style: BorderStyle.solid)),
            hintText: placeholder));
  }
}
