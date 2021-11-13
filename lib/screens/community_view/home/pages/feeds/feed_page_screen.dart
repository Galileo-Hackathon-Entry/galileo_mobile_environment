import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:galileo_hack_environment/utilities/asset_paths.dart';
import 'package:galileo_hack_environment/utilities/theme.dart';

class FeedPageScreen extends StatefulWidget {
  static final routeName = "/feed_page_screen";

  @override
  _FeedPageScreenState createState() => _FeedPageScreenState();
}

class _FeedPageScreenState extends State<FeedPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
         // padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /*Column(
                  children: [
                    SizedBox(
                      child: Text(
                        "Share",
                        style: TextStyle(fontSize: 40.0, color: Theme.of(context).primaryColor, fontFamily: UIFontStyles.MONTSERRAT_BOLD),
                      ),
                    ),
                    Text(
                      "Experience and Ideas",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),*/
                SizedBox(height: 10.0),
                _CardPost(
                  imagePath: "assets/images/johnrev_pic1.png",
                  imagePicPost: "assets/images/feeding_program1.png",
                  name: "John Rev Puno",
                  post: "Thank you for the feeding program opportunity.",
                ),
                _CardPost(
                  imagePath: "assets/images/anthony_pic1.png",
                  imagePicPost: ImagePath.COMMUNITY_PANTRY_PIC1,
                  name: "Mark Anthony",
                  post: "What if magset tayo ng commutiny pantry where people give what they can and get what they need?",
                ),
                _CardPost(
                  imagePath:"assets/images/daryll_pic1.png",
                  imagePicPost: ImagePath.LUGAW_LENI_PIC1,
                  name: "Mark Anthony ",
                  post: "Salamat sa mga nag donate sa Community Pantry.",
                ),
                /* _CardPost(
                  imagePath: ImagePath.JOHNREV_PIC1,
                  imagePicPost: ImagePath.HACKATON_PIC1,
                  name: "John Rev Puno",
                  post:
                      "Salamat mo sa magandang expirience during Hackaton event :D",
                )*/
              ],
            ),
          ),
        ));
  }
}

class _CardPost extends StatelessWidget {
  final String name;
  final String post;
  final String imagePath;
  final String imagePicPost;

  _CardPost({this.name = "Name", this.post = "Post", this.imagePath = ImagePath.MALE_ICON1, this.imagePicPost = ImagePath.QUESTION_MARK_ICON1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            ///margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                        Text("Nov 11, 2021 at 4:30 PM",
                          style: TextStyle(fontSize: 12.0),)
                      ],
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(right: 20.0),
                    child: Icon(FontAwesome.ellipsis_v))
              ],
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                post,
                maxLines: null,
              )),
          Container(
            // color: Colors.red,
            child: Image.asset(
              imagePicPost,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              SizedBox(width: 10.0),
              FlatButton(
                child: Icon(FontAwesome.thumbs_up, color: UIThemeColors.PRIMARY_COLOR),
                onPressed: () {},
              ),
              Text("Like", style: TextStyle(fontSize: 18.0),),
              FlatButton(
                child: Icon(
                  FontAwesome.comment_o,
                  color: UIThemeColors.PRIMARY_COLOR,
                ),
                onPressed: () {},
              ),
              Text("Comment", style: TextStyle(fontSize: 18.0),),
              SizedBox(width: 10.0),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Comment...",
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0), borderSide: BorderSide(color: Colors.grey, width: 1.0, style: BorderStyle.solid)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0), borderSide: BorderSide(color: Colors.grey, width: 1.0, style: BorderStyle.solid)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

