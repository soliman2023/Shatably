
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/more/buttons.dart';

import '../text_utils.dart';
import 'dark_mode_widget.dart';
import 'icon_settings.dart';
import 'language_widget.dart';
import 'logout_widget.dart';

class ContactSetting extends StatelessWidget {
  const ContactSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;
    return Container(
      color: Get.isDarkMode?darkGreyClr:Colors.white,
      padding: const EdgeInsets.only(bottom: 15,top: 10, left: 15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text: "settings".tr,
            color: Get.isDarkMode ? pinkClr : mainColor,
            underLine: TextDecoration.none,
          ),
          const SizedBox(height: 10,),
          DarkModeWidget(),
          const Divider(
            color: Colors.grey,
            height: 15,
            indent: 2,
            thickness: 1,
          ),
          LanguageWidget(),
          const Divider(
            color: Colors.grey,
            height: 25,
            indent: 2,
            thickness: 1,
          ),
           IconSetting(
            color: kColor5,
            text: 'notificationsSounds'.tr,
            icons:  Icons.notifications,
          ),
          const Divider(
            color: Colors.grey,
            height: 25,
            indent: 2,
            thickness: 1,
          ),
           IconSetting(
            color: kColor4,
            text: 'Privacy and Security',
            icons:  Icons.privacy_tip_outlined,
          ),
          const Divider(
            color: Colors.grey,
            height: 25,
            indent: 2,
            thickness: 1,
          ),
          LogOutWidget()

        ],
      ),
    );
  }
}
