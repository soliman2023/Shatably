
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/drawer/header_drawer.dart';
import 'build_list_tile.dart';

class ContactDrawer extends StatelessWidget {
   ContactDrawer({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;

    return Drawer(
      backgroundColor:Get.isDarkMode?darkGreyClr:Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children:  [
              Header(),
            BuildListTile(
              text: 'Language',
              icons: Icons.language,
              onTap: (){},
            ),
            BuildListTile(
              text: 'creditCard',
              icons: Icons.credit_card,
              onTap: (){},
            ),
            BuildListTile(
              text: 'profile',
              icons: Icons.account_box_outlined,
              onTap: (){
                Get.back();
                Get.toNamed(Routes.profileScreen);
              },
            ),
            BuildListTile(
              text: 'electronicEngineer',
              icons: Icons.engineering,
              onTap: ()=>Get.offNamed(Routes.electronicEngineer),
            ),
            const Divider(
              color: Colors.grey,
              height: 15,
              indent: 2,
              thickness: 1,
            ),
            BuildListTile(
              text: 'favorite',
              icons: FontAwesomeIcons.heartCircleBolt,
              onTap: (){
                Get.back();
                Get.toNamed(Routes.favoritesScreen);
              },
            ),
            BuildListTile(
              text: 'discounts',
              icons: Icons.arrow_circle_down,
              onTap: (){},
            ),
            const Divider(
              color: Colors.grey,
              height: 15,
              indent: 2,
              thickness: 1,
            ),
            BuildListTile(
              text: 'share',
              icons: Icons.share,
              onTap: (){},
            ),
            BuildListTile(
              text: 'contactUs',
              icons: Icons.contacts_outlined,
              onTap: (){},
            ),
            GetBuilder<AuthController>(builder: (_){
              return BuildListTile(
                text: 'Logout',
                icons: Icons.logout,
                onTap: (){
                  Get.back();
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
                    },
                    onConfirm: () {
                      authController.signOutFromApp();
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  );
                },
              );
            }),
            const Divider(
              color: Colors.grey,
              height: 15,
              indent: 2,
              thickness: 1,
            ),
            BuildListTile(
              text: 'sendFeedBack',
              icons: Icons.feedback,
              onTap: (){},
            ),
            BuildListTile(
              text: 'complaints',
              icons: FontAwesomeIcons.angry,
              onTap: (){},
            ),
            BuildListTile(
              text: 'shtablyFeather',
              icons: FontAwesomeIcons.feather,
              onTap: (){},
            ),




          ],
        ),
      ),
    );
  }
}
