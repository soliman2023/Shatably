
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/screens/setting/chat-bot.dart';

import '../text_utils.dart';
import 'icon_settings.dart';

class ContactHelp extends StatelessWidget {
  const ContactHelp({Key? key}) : super(key: key);

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
            text: "help".tr,
            color: Get.isDarkMode ? pinkClr : mainColor,
            underLine: TextDecoration.none,
          ),
          const SizedBox(height: 10,),
           IconSetting(
            color: darkSettings,
            text: 'generalChat'.tr,
            icons:  FontAwesomeIcons.comment,
             onTap: ()=>Get.toNamed(Routes.chatScreen),
          ),
          const Divider(
            color: Colors.grey,
            height: 25,
            indent: 2,
            thickness: 1,
          ),
           IconSetting(
            color: languageSettings,
            text: 'chatBot'.tr,
            icons:  FontAwesomeIcons.bots,
             onTap: ()=>Get.toNamed(Routes.chatBotScreen)
             ),
          const Divider(
            color: Colors.grey,
            height: 25,
            indent: 2,
            thickness: 1,
          ),
          const IconSetting(
            color: kColor4,
            text: 'Ask a Question',
            icons:  Icons.message,
          ),
          const Divider(
            color: Colors.grey,
            height: 25,
            indent: 2,
            thickness: 1,
          ),
          const IconSetting(
            color: kColor1,
            text: 'Shtably FAQ',
            icons:  Icons.build_circle_outlined,
          ),
          const Divider(
            color: Colors.grey,
            height: 25,
            indent: 2,
            thickness: 1,
          ),
          const IconSetting(
            color: notiSettings,
            text: 'Privacy Policy',
            icons:  Icons.policy,
          ),


        ],
      ),
    );
  }
}
