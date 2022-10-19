
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/view/widgets/setting/add_credit_card.dart';
import 'package:graduation_project/view/widgets/setting/contact_help.dart';
import 'package:graduation_project/view/widgets/setting/contact_setting.dart';
import 'package:graduation_project/view/widgets/setting/profile_widget.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;
    //authController.getDateUsers();
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 20,
          ),
          const AddCreditCard(),
          const SizedBox(
            height: 20,
          ),
          const ContactSetting(),
          const SizedBox(
            height: 20,
          ),
          const ContactHelp(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextUtils(
                    fontSize: 15,
                    mixLine: 2,
                    fontWeight: FontWeight.normal,
                    text: 'Shtably for Android v1.0.0 by Mina Mamdouh',
                    color: Get.isDarkMode?Colors.white:Colors.black,
                    underLine: TextDecoration.none),
              ),
            ],
          ),


        ],
      ),
    );
  }
}
