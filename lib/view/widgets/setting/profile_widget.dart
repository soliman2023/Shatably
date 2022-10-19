
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/logic/controllers/settings_controller.dart';
import 'package:graduation_project/units/theme.dart';
import '../text_utils.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;
    authController.getDateUsers();
    return Stack(
      children: [
        Column(
          children: [
            Container(
              color: Get.isDarkMode?pinkClr:Colors.deepOrange,
              padding: const EdgeInsets.only(bottom: 15,top: 10, left: 15,right: 15),
              child: GetBuilder<AuthController>(builder: (_){
                return Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(authController.userImageUrl,
                          ),
                          onError: (Object,StackTrace){

                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          text: controller
                              .capitalize(authController.userName),
                          color: Colors.white ,
                          underLine: TextDecoration.none,
                        ),
                        TextUtils(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          text:'online'.tr,
                          color: Colors.greenAccent,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),

            Container(
              width: double.infinity,
              color: Get.isDarkMode?darkGreyClr:Colors.white,
              padding: const EdgeInsets.only(top: 10, left: 15,right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: 'account'.tr,
                    color: Get.isDarkMode?pinkClr:mainColor ,
                    underLine: TextDecoration.none,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          text:'+2${authController.userPhoneNumber}',
                          color: Get.isDarkMode?Colors.white:Colors.black ,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(height: 5,),
                        TextUtils(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          text:'changeNumber'.tr,
                          color: Get.isDarkMode?Colors.white:Colors.black ,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 5,
                    indent: 2,
                    thickness: 1,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 10,top:10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          text:authController.userEmail,
                          color: Get.isDarkMode?Colors.white:Colors.black ,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(height: 5,),
                        TextUtils(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          text:'email'.tr,
                          color: Get.isDarkMode?Colors.white:Colors.black ,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 5,
                    indent: 2,
                    thickness: 1,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 10,top:10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          text:authController.userJop,
                          color: Get.isDarkMode?Colors.white:Colors.black ,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(height: 5,),
                        TextUtils(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          text:'jop'.tr,
                          color: Get.isDarkMode?Colors.white:Colors.black ,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ),

          ],
        ),
        Positioned(
          right: Get.locale==Locale('ar')?320:20,
          //left:Get.locale==Locale('ar')?0:100,
          top: 90,
          child: Container(
            width: 60,
            height: 60,
            decoration:  BoxDecoration(
                color: Get.isDarkMode?darkGreyClr:Colors.white,
                shape: BoxShape.circle
            ),

            child:  Center(
              child:
              InkWell(
                onTap: (){},
                child:  Icon(Icons.add_a_photo_outlined,size: 40,
                  color: Get.isDarkMode?pinkClr:Colors.deepOrange,
                ),
              ),
            ),),
        ),
      ],
    );
  }
}
