
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/electronic_engineer/result.dart';
import 'package:graduation_project/view/widgets/electronic_engineer/text_filed.dart';
import 'package:graduation_project/view/widgets/more/buttons.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';

class HomeIronInventory extends StatelessWidget {
  const HomeIronInventory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          foregroundColor: Colors.white,
          elevation: 0.0,
          backgroundColor: Get.isDarkMode?pinkClr:mainColor,
          title: TextUtils(
            text: 'ironInventory'.tr,
            color: Colors.white,
            underLine: TextDecoration.none,
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),
          bottom: TabBar(
            tabs: [
              TextUtils(
                text: 'rectangularColumn'.tr,
                color: Colors.white,
                underLine: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              TextUtils(
                text: 'beams'.tr,
                color: Colors.white,
                underLine: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              TextUtils(
                text: 'floors'.tr,
                color: Colors.white,
                underLine: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              TextUtils(
                text: 'ceilingTilesCamry'.tr,
                color: Colors.white,
                underLine: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              TextUtils(
                text: 'ceilingTilesAcrylic'.tr,
                color: Colors.white,
                underLine: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ],
            indicatorColor: Colors.deepOrange,
            isScrollable: true,
          ),
        ),
        body: const TabBarView(
          children: [
            RectangularColumn(),
            Beams(),
            Floors(),
            CeilingTilesCamry(),
            CeilingTilesAcrylic(),
          ],
        ),
      ),
    );
  }
}


class RectangularColumn extends StatelessWidget {
  const RectangularColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: GridView(
                padding: const EdgeInsets.symmetric(vertical: 5),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 70,
                    mainAxisSpacing: 5,
                    childAspectRatio: 3/2
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  TextFiledEng(hintText: 'meter'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'width'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'height'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'numberOfColumns'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'cementContent'.tr,
                      controller: TextEditingController()),

                ],
              ),
            ),
            CreateGenButtons(
              text: 'calculate'.tr,
              onTap: (){},
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.grey,
              height: 15,
              indent: 2,
              thickness: 1,
            ),
            ResultRow(
              text1: 'amountOfConcrete'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfCement'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfRocks'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfSand'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfWater'.tr,
              text2: '0.0',
            ),
          ],
        ),
      ),
    );
  }
}



class Beams extends StatelessWidget {
  const Beams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: GridView(
                padding: const EdgeInsets.symmetric(vertical: 5),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 70,
                    mainAxisSpacing: 5,
                    childAspectRatio: 3/2
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  TextFiledEng(hintText: 'meter'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'width'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'height'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'numberOfBeams'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'cementContent'.tr,
                      controller: TextEditingController()),

                ],
              ),
            ),
            CreateGenButtons(
              text: 'calculate'.tr,
              onTap: (){},
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.grey,
              height: 15,
              indent: 2,
              thickness: 1,
            ),
            ResultRow(
              text1: 'amountOfConcrete'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfCement'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfRocks'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfSand'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfWater'.tr,
              text2: '0.0',
            ),
          ],
        ),
      ),
    );
  }
}

class Floors extends StatelessWidget {
  const Floors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: GridView(
                padding: const EdgeInsets.symmetric(vertical: 5),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 70,
                    mainAxisSpacing: 5,
                    childAspectRatio: 3/2
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  TextFiledEng(hintText: 'meter'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'width'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'height'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'numberOfFloors'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'cementContent'.tr,
                      controller: TextEditingController()),

                ],
              ),
            ),
            CreateGenButtons(
              text: 'calculate'.tr,
              onTap: (){},
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.grey,
              height: 15,
              indent: 2,
              thickness: 1,
            ),
            ResultRow(
              text1: 'amountOfConcrete'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfCement'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfRocks'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfSand'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfWater'.tr,
              text2: '0.0',
            ),
          ],
        ),
      ),
    );
  }
}

class CeilingTilesCamry extends StatelessWidget {
  const CeilingTilesCamry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: GridView(
                padding: const EdgeInsets.symmetric(vertical: 5),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 70,
                    mainAxisSpacing: 5,
                    childAspectRatio: 3/2
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  TextFiledEng(hintText: 'meter'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'width'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'slabThickness'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'numberOfTiles'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'cementContent'.tr,
                      controller: TextEditingController()),
                ],
              ),
            ),
            CreateGenButtons(
              text: 'calculate'.tr,
              onTap: (){},
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.grey,
              height: 15,
              indent: 2,
              thickness: 1,
            ),
            ResultRow(
              text1: 'amountOfConcrete'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfCement'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfRocks'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfSand'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfWater'.tr,
              text2: '0.0',
            ),
          ],
        ),
      ),
    );
  }
}

class CeilingTilesAcrylic extends StatelessWidget {
  const CeilingTilesAcrylic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: GridView(
                padding: const EdgeInsets.symmetric(vertical: 5),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 70,
                    mainAxisSpacing: 5,
                    childAspectRatio: 3/2
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  TextFiledEng(hintText: 'meter'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'width'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'slabThickness'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'numberOfTiles'.tr,
                      controller: TextEditingController()),
                  TextFiledEng(hintText: 'cementContent'.tr,
                      controller: TextEditingController()),
                ],
              ),
            ),
            CreateGenButtons(
              text: 'calculate'.tr,
              onTap: (){},
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.grey,
              height: 15,
              indent: 2,
              thickness: 1,
            ),
            ResultRow(
              text1: 'amountOfConcrete'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfCement'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfRocks'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfSand'.tr,
              text2: '0.0',
            ),
            ResultRow(
              text1: 'amountOfWater'.tr,
              text2: '0.0',
            ),
          ],
        ),
      ),
    );
  }
}




