
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/category_controller.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/category/category_items.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class CategorySliders extends StatefulWidget {
  const CategorySliders({
    Key? key,
  }) : super(key: key);

  @override
  _CategorySlidersState createState() => _CategorySlidersState();
}

class _CategorySlidersState extends State<CategorySliders> {
  CarouselController carouselController = CarouselController();

  final controller = Get.find<CategoryController>();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Obx(
          () {
        if (controller.isCategoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Stack(
            children: [
              CarouselSlider.builder(
                itemCount: controller.categoryNameList.length,
                carouselController: carouselController,
                options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    autoPlayInterval: const Duration(seconds: 2),
                    viewportFraction: 1,

                    onPageChanged: (index, reson) {
                      setState(() {
                        currentPage = index;
                      });
                    }),
                itemBuilder: (context, index, realIndex) {
                  return InkWell(
                    onTap: () {
                      controller.getCategoryIndex(index);
                      Get.to(() => CategoryItems(
                        catehoryTitle: controller.categoryNameList[index],
                      ));
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            controller.imageCategory[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'ادوات الشطيب',
                            style: const TextStyle(
                              backgroundColor: Colors.black38,
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 30,
                left: 180,
                child: AnimatedSmoothIndicator(
                  activeIndex: currentPage,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
                    dotColor: Colors.black,
                  ),
                ),
              ),

            ],
          );
        }
      },
    );
  }
}
