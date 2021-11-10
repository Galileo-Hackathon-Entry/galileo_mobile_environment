import 'package:flutter/material.dart';

/*class CardHorizontal extends StatelessWidget {
  CardHorizontal(
      {this.title = "Placeholder Title",
      this.cta = "",
      this.img = ImagePath.QUESTION_MARK_ICON1,
      this.tap = defaultFunc});

  final String cta;
  final String img;
  final Function tap;
  final String title;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        child: GestureDetector(
          onTap: tap,
          child: Card(
            elevation: 3,
            shadowColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                      child: Image.asset(img),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            bottomLeft: Radius.circular(4.0)),
                      )),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("John Rev R. Puno, 22",
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Text("1")
                            ],
                          )
Text(
                              "\"Courage is not the absence of fear but the understanding that there is something more important that exist\"",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,

                              softWrap: true,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              )),

                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}*/
