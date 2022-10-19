

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/more/buttons.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';


class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;
    authController.getDateUsers();
    return Scaffold(
      backgroundColor: Get.isDarkMode?pinkClr:mainColor,
      appBar: AppBar(
        centerTitle: true,
        title: TextUtils(
          color: Colors.white,
          underLine: TextDecoration.none,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          text: 'profile'.tr,
        ),
        elevation: 0.0,
        foregroundColor: Colors.white,
        backgroundColor: Get.isDarkMode?pinkClr:mainColor,
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            color:Get.isDarkMode?pinkClr:mainColor,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: CircleAvatar(
                radius: 65,
                backgroundImage: NetworkImage(authController.userImageUrl),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,
              vertical: 15),
              decoration: BoxDecoration(
                  color:Get.isDarkMode?darkGreyClr:Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const  SizedBox(height: 15,),
                    TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: 'userId'.tr,
                        color: Get.isDarkMode?Colors.grey.shade300:Colors.grey,
                        underLine: TextDecoration.none),
                    const  SizedBox(height: 3,),
                    TextUtils(
                        fontSize: 18,
                        mixLine: 2,
                        fontWeight: FontWeight.w500,
                        text: authController.userId,
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        underLine: TextDecoration.none),
                    const Divider(
                      color: Colors.grey,
                      height: 15,
                      indent: 2,
                      thickness: 1,
                    ),
                    TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: 'userName'.tr,
                        color: Get.isDarkMode?Colors.grey.shade300:Colors.grey,
                        underLine: TextDecoration.none),
                    const  SizedBox(height: 3,),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        text: authController.userName,
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        underLine: TextDecoration.none),
                    const Divider(
                      color: Colors.grey,
                      height: 15,
                      indent: 2,
                      thickness: 1,
                    ),
                    TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: 'email'.tr,
                        color: Get.isDarkMode?Colors.grey.shade300:Colors.grey,
                        underLine: TextDecoration.none),
                    const  SizedBox(height: 3,),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        text: authController.userEmail,
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        underLine: TextDecoration.none),
                    const Divider(
                      color: Colors.grey,
                      height: 15,
                      indent: 2,
                      thickness: 1,
                    ),
                    TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: 'phoneNumber'.tr,
                        color: Get.isDarkMode?Colors.grey.shade300:Colors.grey,
                        underLine: TextDecoration.none),
                    const  SizedBox(height: 3,),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        text: '+2 ${authController.userPhoneNumber}',
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        underLine: TextDecoration.none),
                    const Divider(
                      color: Colors.grey,
                      height: 15,
                      indent: 2,
                      thickness: 1,
                    ),
                    TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: 'typeAccount'.tr,
                        color: Get.isDarkMode?Colors.grey.shade300:Colors.grey,
                        underLine: TextDecoration.none),
                    const  SizedBox(height: 3,),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        text: authController.userTypeAccount,
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        underLine: TextDecoration.none),
                    const Divider(
                      color: Colors.grey,
                      height: 15,
                      indent: 2,
                      thickness: 1,
                    ),
                    TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: 'jop'.tr,
                        color: Get.isDarkMode?Colors.grey.shade300:Colors.grey,
                        underLine: TextDecoration.none),
                    const  SizedBox(height: 3,),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        text: authController.userJop,
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        underLine: TextDecoration.none),
                    const Divider(
                      color: Colors.grey,
                      height: 15,
                      indent: 2,
                      thickness: 1,
                    ),
                    TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: 'age'.tr,
                        color: Get.isDarkMode?Colors.grey.shade300:Colors.grey,
                        underLine: TextDecoration.none),
                    const  SizedBox(height: 3,),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        text: '${authController.userAge}',
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        underLine: TextDecoration.none),
                    const Divider(
                      color: Colors.grey,
                      height: 15,
                      indent: 2,
                      thickness: 1,
                    ),
                    TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: 'location'.tr,
                        color: Get.isDarkMode?Colors.grey.shade300:Colors.grey,
                        underLine: TextDecoration.none),
                    const  SizedBox(height: 3,),
                    TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        text: authController.userLocation,
                        mixLine: 2,
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        underLine: TextDecoration.none),
                    const Divider(
                      color: Colors.grey,
                      height: 15,
                      indent: 2,
                      thickness: 1,
                    ),
                    TextUtils(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        text: 'joinAt'.tr,
                        color: Get.isDarkMode?Colors.grey.shade300:Colors.grey,
                        underLine: TextDecoration.none),
                    const  SizedBox(height: 3,),
                    TextUtils(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        mixLine: 2,
                        text: '${authController.userJoin.toDate()}',
                        fontStyle: FontStyle.italic,
                        color: Get.isDarkMode?Colors.white:Colors.black,
                        underLine: TextDecoration.none),
                    const SizedBox(height: 15,),

                  /*  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCircleAvatar(color: Colors.green,icons: FontAwesomeIcons.whatsapp,fct: ()async{
                          String phoneNum='0121025';
                          await launch('https://send/$phoneNum/?text=Hello');
                        }),
                        buildCircleAvatar(color: Colors.pink,icons: Icons.email,fct: ()async{
                          String email='myOwnEmailAddress@gmail.com';
                          await launch('mailto:$email');

                        }),
                        buildCircleAvatar(color: Colors.purple,icons: Icons.call,fct: ()async{
                          String phone='0121025';
                          await launch('tel:$phone');


                        }),
                      ],
                    ),
                    const Divider(color: Colors.black,
                      height:30,),*/
                    Row(
                      children: [
                        Expanded(child: CreateGenButtons(
                          text: 'Show Location',
                          onTap: (){},
                        )),
                        const SizedBox(width: 8,),
                        GetBuilder<AuthController>(builder:(_){
                          return Expanded(child: CreateGenButtons(
                            text: 'LogOut',
                            onTap: (){

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
                          ));
                        } ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )


        ],
      ),
    );
  }



}
