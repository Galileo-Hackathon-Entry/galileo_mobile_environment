import 'dart:io';
import 'package:galileo_hack_environment/utilities/asset_paths.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:flutter/material.dart';

class UploadPhoto extends StatelessWidget {
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

  UploadPhoto({
    this.labelText = "",
    this.iconPath = ImagePath.QUESTION_MARK_ICON1,
    this.optionSelect = 1,
    this.funcCamera,
    this.funcUpload,
    this.image,
    this.isValid = false,
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
                    Text(
                      labelText,
                      style: TextStyle(
                        color: UIThemeColors.TEXT_COLOR1,
                        fontSize: 11.0,
                      ),
                    ),
                    Visibility(
                      visible: showButton,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
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
                  : /*AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.file(image),
                    ),*/
              Container(
                  height: 230.0,
                  child: Image.file(image)),
              bottomLabel.isEmpty
                  ? Container()
                  : Text(
                      bottomLabel,
                      style: TextStyle(fontSize: 13.0),
                      textAlign: TextAlign.center,
                    ),
              SizedBox(height: 10.0),
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
                          child: Row(
                            children: [
                              Icon(Icons.upload_outlined, color: UIThemeColors.TEXT_COLOR1),
                              Text("Upload",
                                  style: TextStyle(
                                    color: UIThemeColors.TEXT_COLOR1,
                                    fontSize: 12.0,
                                  )),
                            ],
                          ),
                          onPressed: () => funcUpload(),
                        ),
                        SizedBox(width: 15.0),
                        TextButton(
                          style: TextButton.styleFrom(
                            //  minimumSize: Size(_width, _height),
                            backgroundColor: Colors.yellow,
                            padding: EdgeInsets.all(10.0),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.camera_alt_outlined, color: UIThemeColors.TEXT_COLOR1),
                              Text("Camera",
                                  style: TextStyle(
                                    color: UIThemeColors.TEXT_COLOR1,
                                    fontSize: 12.0,
                                  )),
                            ],
                          ),
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
          child: Container(padding: EdgeInsets.only(left: 10.0, top: 7.0), child: Text("Photo is Required.", style: TextStyle(color: Colors.red, fontSize: 12.0))),
        )
      ],
    );
  }
}
/*

class UploadVideo extends StatelessWidget {
  final String labelText;
  final String iconPath;
  final int optionSelect;
  final Function funcCamera;
  final Function funcUpload;
  final VideoPlayerController videoController;
  final bool isVideoInitialized;
  final bool isVideoValid;

  UploadVideo(
      {this.labelText = "",
      this.iconPath = ImagePath.QUESTION_MARK_ICON1,
      this.optionSelect = 1,
      this.funcCamera,
      this.funcUpload,
      this.videoController,
      this.isVideoInitialized = false,
      this.isVideoValid});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
            border:
                Border.all(color: isVideoValid ? Colors.grey[400] : Colors.red),
            borderRadius: BorderRadius.circular(3.0),
          ),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(labelText)],
                ),
              ),
              videoController != null
                  ? AspectRatio(
                      aspectRatio: videoController.value.aspectRatio,
                      child: VideoPlayer(videoController))
                  : Container(
                      width: 120.0,
                      height: 120.0,
                      child: Image.asset(iconPath)),
              optionSelect == 1
                  ? TextButton(
                      style: TextButton.styleFrom(
                        //  minimumSize: Size(_width, _height),
                        backgroundColor: Colors.yellow,
                        padding: EdgeInsets.all(10.0),
                      ),
                      //color: Colors.yellow,
                      child:
                          Text("Upload", style: TextStyle(color: Colors.black)),
                      onPressed: () => funcUpload(),
                    )
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
                          child: Text("Upload",
                              style: TextStyle(color: Colors.black)),
                          onPressed: () => funcUpload(),
                        ),
                        SizedBox(width: 15.0),
                        TextButton(
                          style: TextButton.styleFrom(
                            //  minimumSize: Size(_width, _height),
                            backgroundColor: Colors.yellow,
                            padding: EdgeInsets.all(10.0),
                          ),
                          child: Text("Camera",
                              style: TextStyle(color: Colors.black)),
                          onPressed: () => funcCamera(),
                        ),
                      ],
                    )
            ],
          ),
        ),
        Visibility(
          maintainSize: false,
          visible: !isVideoValid,
          child: Container(
              padding: EdgeInsets.only(left: 10.0, top: 7.0),
              child: Text("Video is Required.",
                  style: TextStyle(color: Colors.red, fontSize: 12.0))),
        )
      ],
    );
  }
}
*/
