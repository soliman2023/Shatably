
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class BuildListTile extends StatelessWidget {
  final String text;
  final IconData icons;
  final Function() onTap;
  const BuildListTile({Key? key,
    required this.text,
    required this.icons,
    required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;
    return ListTile(
      title: TextUtils(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        text: text.tr,
        color: Get.isDarkMode ? Colors.white : Colors.black,
        underLine: TextDecoration.none,
      ),
      leading:  Icon(icons,
        color: Colors.grey,
        size: 27,),
      onTap: onTap,

    );
  }
}
