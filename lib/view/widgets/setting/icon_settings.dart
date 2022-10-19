
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../text_utils.dart';

class IconSetting extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icons;
  final Function()? onTap;
  const IconSetting({Key? key, required this.color,
    required  this.text,
    required  this.icons,
     this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors=context.theme.backgroundColor;
    return GestureDetector(
      onTap: onTap??(){},
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child:  Icon(
                icons,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            TextUtils(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              text: text.tr,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              underLine: TextDecoration.none,
            ),
          ],
        ),
      ),
    );
  }
}
