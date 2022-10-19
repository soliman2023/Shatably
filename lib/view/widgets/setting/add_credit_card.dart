
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/screens/setting/credit-card.dart';
import 'package:graduation_project/view/widgets/more/buttons.dart';

import '../text_utils.dart';

class AddCreditCard extends StatelessWidget {
  const AddCreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;
    return Container(
      color: Get.isDarkMode?darkGreyClr:Colors.white,
      padding: const EdgeInsets.only(bottom: 15,top: 10, left: 15,right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            text: "titleCard".tr,
            color: Get.isDarkMode ? pinkClr : mainColor,
            mixLine: 2,
            underLine: TextDecoration.none,
          ),
          const SizedBox(height: 10,),
          TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: "subTitleCard".tr,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            mixLine: 4,
            underLine: TextDecoration.none,
          ),
          const SizedBox(height: 10,),
          CreateGenButtons(
            onTap: ()=>Get.toNamed(Routes.creditCardScreen),
            text: 'buttonCard'.tr,
          )
        ],

      ),
    );
  }
}
