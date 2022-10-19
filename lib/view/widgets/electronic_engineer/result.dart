
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/units/theme.dart';

import '../text_utils.dart';

class ResultRow extends StatelessWidget {
  final String text1;
  final String text2;
  const ResultRow({Key? key,required  this.text1,required  this.text2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              decoration: BoxDecoration(
                  color: Get.isDarkMode?darkGreyClr:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1,
                      color: Get.isDarkMode?pinkClr:mainColor
                  )
              ),
              child: Center(
                child: TextUtils(
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  text: text1,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  mixLine: 2,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              decoration: BoxDecoration(
                  color: Get.isDarkMode?darkGreyClr:Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1,
                      color: Get.isDarkMode?pinkClr:mainColor
                  )
              ),
              child: Center(
                child: TextUtils(
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  text: text2,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
