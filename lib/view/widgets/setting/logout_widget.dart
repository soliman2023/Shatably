
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/logic/controllers/settings_controller.dart';
import 'package:graduation_project/units/theme.dart';


import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);


  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
              title: "Logout From App",
              titleStyle:  TextStyle(
                fontSize: 18,
                color: Get.isDarkMode?Colors.white:Colors.black,
                fontWeight: FontWeight.bold,
              ),
              middleText: 'Are you sure you need to logout',
              middleTextStyle:  TextStyle(
                fontSize: 18,
                color: Get.isDarkMode?Colors.white:Colors.black,
                fontWeight: FontWeight.bold,
              ),
              radius: 10,
              textCancel: " No ",
              cancelTextColor: Get.isDarkMode?Colors.pink:Colors.deepOrange,
              textConfirm: " YES ",
              confirmTextColor: Colors.white,
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                authController.signOutFromApp();
              },
              buttonColor: Get.isDarkMode ? pinkClr : mainColor,
            );
          },
          splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
          borderRadius: BorderRadius.circular(12),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                text: "Logout".tr,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
        ),
      );
    });
  }
}
