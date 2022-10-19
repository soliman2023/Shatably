
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/units/theme.dart';

import '../text_utils.dart';

class CreateGenButtons extends StatelessWidget {
  final Function() onTap;
  final String text;
  const CreateGenButtons({Key? key,required this.onTap,
    required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      minWidth: double.infinity,
      color: Get.isDarkMode?pinkClr:mainColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextUtils(
          color: Colors.white,
          fontSize: 20,
          text: text,
          fontWeight: FontWeight.bold,
          underLine:TextDecoration.none,
        ),
      ),);
  }
}
