
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/drawer/contact_drawer.dart';
import 'package:graduation_project/view/widgets/electronic_engineer/card_home.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';
import 'package:lottie/lottie.dart';

class HomeEngineer extends StatelessWidget {
  const HomeEngineer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        title: TextUtils(
          text: 'electronicEngineer'.tr,
          color: Colors.white,
           fontWeight: FontWeight.bold,
          fontSize: 20,
          underLine: TextDecoration.none,
        ),
        backgroundColor: Get.isDarkMode?pinkClr:mainColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.offNamed(Routes.mainScreen);
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      drawer:  ContactDrawer(),
      body: Column(
        children: [
          Lottie.asset('assets/image/spalsh.json',
          width: double.infinity,
          height: 250),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 180,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3/2
                ),
                itemBuilder: (context,index){
                  return CardHome(index: index,);
                },
            itemCount: 4,),
          ),
        ],
      ),
    );
  }
}
