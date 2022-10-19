import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color mainColor = Colors.deepOrange;
const Color darkGreyClr = Color(0xFF212330);
const Color pinkClr = Color(0xFFff4667);
const Color backDark = Color(0xFF191919);
const Color backLight = Color(0xFFCBCBCB);



const Color kColor1 = Color(0xff685959);
const Color kColor2 = Color(0xffADA79B);
const Color kColor3 = Color(0xffA5947F);
const Color kColor4 = Color(0xff738B71);
const Color kColor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    backgroundColor: backLight,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    backgroundColor: backDark,
    brightness: Brightness.dark,
  );
}

TextStyle get headingStyle{
  return TextStyle(
    color:Get.isDarkMode?Colors.white:Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
}
TextStyle get titleStyle{
  return TextStyle(
      color:Get.isDarkMode?Colors.grey:Colors.grey[850],
      fontSize: 18,
      wordSpacing: 2,
      letterSpacing: 1.5,
      fontWeight: FontWeight.normal);

}
