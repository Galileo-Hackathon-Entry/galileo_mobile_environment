import 'package:galileo_hack_environment/utilities/theme.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final Function function;
  final String label;
  final Color color;
  final String fontFamily;
  final double fontSize;

  OptionButton({this.function, this.label, this.color = UIThemeColors.TEXT_COLOR1, this.fontFamily = UIFontStyles.CLASH_OF_CLANS, this.fontSize = 14.0});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: UIThemeColors.WHITE_COLOR1,
        side: BorderSide(color: color),
       // splashFactory: InkRipple.splashFactory,
      ),
      onPressed: () => function(),
      child: Text(label,
          style: TextStyle(
            color: color,
            fontFamily: fontFamily,
            fontSize: fontSize,
          )),
    );
  }
}
