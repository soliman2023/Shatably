
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/units/theme.dart';

class TextFiledEng extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const TextFiledEng({Key? key,required this.hintText,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        hintText: hintText,
        labelStyle: TextStyle(
            color: Get.isDarkMode?pinkClr:mainColor,
        ),
        focusColor: Colors.white,
        fillColor: Get.isDarkMode?darkGreyClr:Colors.grey.shade300,
        enabled: true,
        filled: true,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey
            )),
        focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(
                color:Get.isDarkMode?pinkClr:mainColor
            )
        ),

      ),
    );
  }
}
