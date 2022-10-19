import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TextUtils extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration underLine;
   FontStyle? fontStyle;
   int? mixLine;

   TextUtils({
    required this.fontSize,
    required this.fontWeight,
    required this.text,
    required this.color,
    required this.underLine,
    this.mixLine,
     this.fontStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: mixLine??1,
      textAlign: TextAlign.start,
      softWrap: true,
      overflow: TextOverflow.visible,
      style:  TextStyle(
      decoration: underLine,
      fontStyle: fontStyle??FontStyle.normal,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    );
  }
}

class RichTextUtils extends StatelessWidget {
  final String mainText;
  final String normalText;
  const RichTextUtils({Key? key,required this.mainText,required this.normalText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: [
              TextSpan(text: mainText,
                  style: TextStyle(
                    color: Get.isDarkMode?Colors.white:Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(text: normalText,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode?Colors.white:Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),),
            ]
        ));
  }
}

