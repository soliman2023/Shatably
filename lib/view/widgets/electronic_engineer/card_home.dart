
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/elctronic_engineer.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/screens/drawer/electronic_engineer/concrete_inventory.dart';
import 'package:graduation_project/view/screens/drawer/electronic_engineer/iron_inventory.dart';
import 'package:lottie/lottie.dart';

import '../text_utils.dart';

class CardHome extends StatelessWidget {
  final int index;

   CardHome({Key? key,required  this.index}) : super(key: key);

  List<ElectronicEngineerModel> items=[
    ElectronicEngineerModel(
      text: 'concreteInventory',
      image: 'spalsh.json',
      onTap: ()=>Get.to(const HomeConcreteInventory()),
    ),
    ElectronicEngineerModel(
      text: 'ironInventory',
      image: 'spalsh.json',
      onTap: ()=>Get.to(const HomeIronInventory()),
    ),
    ElectronicEngineerModel(
      text: 'mm3',
      image: 'spalsh.json',
      onTap: ()=>Get.to(const HomeConcreteInventory()),
    ),
    ElectronicEngineerModel(
      text: 'mm4',
      image: 'spalsh.json',
      onTap: ()=>Get.to(const HomeConcreteInventory()),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: items[index].onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:Get.isDarkMode? darkGreyClr:Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child:
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Lottie.asset('assets/image/${items[index].image}')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
              child: TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: items[index].text.tr,
                  mixLine: 2,
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  underLine: TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}
