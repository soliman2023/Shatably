
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/logic/controllers/settings_controller.dart';
import 'package:graduation_project/logic/controllers/theme_controller.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';

class Header extends StatelessWidget {
   Header({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();
   final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;
    authController.getDateUsers();
    timeDilation == 20.0;
    return Container(
      color: Get.isDarkMode?pinkClr:mainColor,
      child: GetBuilder<AuthController>(
        builder: (_){
          return DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        CircleAvatar(
                        radius: 42,
                        //backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(authController.userImageUrl),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: (){
                            ThemeController().changesTheme();
                          },
                          icon: const Icon(Icons.lightbulb_outline,
                            color: Colors.white,
                            size: 30,))
                    ],
                  ),
                  TextUtils(fontSize:20 ,
                      fontWeight: FontWeight.bold,
                      text: controller
                          .capitalize(authController.userName),
                      color: Colors.white,
                      underLine: TextDecoration.none),
                  TextUtils(fontSize:18 ,
                      fontWeight: FontWeight.normal,
                      text: '+2${authController.userPhoneNumber}',
                      color: Colors.grey.shade300,
                      underLine: TextDecoration.none),
                ],
              ));
        },
      ),
    );
  }
}
