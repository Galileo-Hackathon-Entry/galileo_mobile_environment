import 'package:galileo_hack_environment/utilities/asset_paths.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:galileo_hack_environment/widgets/option_button.dart';
import 'package:progress_dialog/progress_dialog.dart';

class CommonWidgets {
  static ProgressDialog progressDialog(BuildContext context, {String message = "Please wait..."}) => ProgressDialog(context, type: ProgressDialogType.Normal, isDismissible: false)
    ..style(
      message: message ?? "Please wait...",
      progressWidget: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
            backgroundColor: UIThemeColors.PRIMARY_COLOR,
          ),
        ),
      ),
      maxProgress: 100.0,
      progressTextStyle: TextStyle(fontSize: 13.0),
      messageTextStyle: TextStyle(fontSize: 13.0, color: UIThemeColors.PRIMARY_COLOR),
    );

  static showToast(String message) {
    Fluttertoast.cancel();

    Fluttertoast.showToast(String: message);
  }
}

class ErrorDialog extends StatelessWidget {
  final String message;
  final Function funcOK;

  ErrorDialog({this.message, this.funcOK});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(30.0, 35.0, 30.0, 0.0),
          child: Card(
            elevation: 5.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    message ?? "",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 15,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: UIThemeColors.TEXT_COLOR1,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  width: double.infinity,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: UIThemeColors.PRIMARY_COLOR,
                    onPressed: () => funcOK(),
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
        Container(
          height: 80.0,
          alignment: Alignment.center,
          child: Icon(
            Icons.close,
            size: 50.0,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.red,
              width: 3.0,
            ),
          ),
        ),
        Container(
          height: 80.0,
          alignment: Alignment.center,
          child: Icon(
            Icons.close,
            size: 50.0,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.red,
              width: 3.0,
            ),
          ),
        ),
      ],
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String message;
  final Function funcOK;

  SuccessDialog({this.message, this.funcOK});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(30.0, 35.0, 30.0, 0.0),
          child: Card(
            elevation: 5.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    message ?? "",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 15,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: UIThemeColors.TEXT_COLOR1,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  width: double.infinity,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: UIThemeColors.PRIMARY_COLOR,
                    onPressed: () => funcOK(),
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
        Container(
          height: 80.0,
          alignment: Alignment.center,
          child: Icon(
            Icons.close,
            size: 50.0,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.red,
              width: 3.0,
            ),
          ),
        ),
        Container(
          height: 80.0,
          alignment: Alignment.center,
          child: Icon(
            Icons.check,
            size: 50.0,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.green,
              width: 3.0,
            ),
          ),
        ),
      ],
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  final String message;
  final Function funcYes;
  final Function funcNo;

  ConfirmationDialog({
    this.message = "",
    this.funcYes,
    this.funcNo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(30.0, 35.0, 30.0, 0.0),
          child: Card(
            elevation: 5.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey,
                        )),
                    SizedBox(width: 10.0)
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    message ?? "",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 15,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: UIThemeColors.TEXT_COLOR1,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          width: double.infinity,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: UIThemeColors.PRIMARY_COLOR,
                            onPressed: () => funcYes(),
                            child: Text(
                              "Yes",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          width: double.infinity,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: Colors.red[300],
                            onPressed: () => funcNo(),
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
        Container(
          height: 80.0,
          alignment: Alignment.center,
          child: Icon(
            Icons.close,
            size: 50.0,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.red,
              width: 3.0,
            ),
          ),
        ),
        Container(
          height: 80.0,
          alignment: Alignment.center,
          child: Icon(
            Icons.lightbulb_outline,
            size: 50.0,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.yellow[500],
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.yellow[500],
              width: 3.0,
            ),
          ),
        )
      ],
    );
  }
}

class UpdateAppDialog extends StatelessWidget {
  final String message;
  final Function funcOk;
  final Function funcNo;

  UpdateAppDialog({
    this.message,
    this.funcOk,
    this.funcNo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(30.0, 35.0, 30.0, 0.0),
          child: Card(
            elevation: 5.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                Image.asset(ImagePath.UPDATE_ICON2),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    message ?? "",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 15,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: UIFontStyles.MONTSERRAT_BOLD,
                      color: UIThemeColors.TEXT_COLOR1,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  width: double.infinity,
                  child: OptionButton(
                    label: "OK, Download APK",
                    color: UIThemeColors.GREEN_COLOR1,
                    function: () => funcOk(),
                    fontFamily: UIFontStyles.MONTSERRAT_BOLD,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  width: double.infinity,
                  child: OptionButton(
                    label: "NO, Close app",
                    color: UIThemeColors.RED_COLOR1,
                    function: () => funcNo(),
                    fontFamily: UIFontStyles.MONTSERRAT_BOLD,
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
