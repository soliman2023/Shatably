
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/settings_controller.dart';
import 'package:graduation_project/logic/controllers/theme_controller.dart';
import 'package:graduation_project/units/theme.dart';

import '../text_utils.dart';
import 'icon_settings.dart';


class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
  //final controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: ((_){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const IconSetting(
            color: darkSettings,
            text: 'Dark Mode',
            icons:  Icons.dark_mode,
          ),
          Switch(
            activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
            activeColor: Get.isDarkMode ? pinkClr : mainColor,
            value: controller.switchValue,
            onChanged: (value) {
              ThemeController().changesTheme();
              //controller.switchValue = value;
              controller.switchTheme(value);
            },
          ),
        ],
      );
    }));
  }


}
