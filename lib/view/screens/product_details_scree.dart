
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/cart_controller.dart';
import 'package:graduation_project/model/product_models.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/productDetails/add_cart.dart';
import 'package:graduation_project/view/widgets/productDetails/clothes_info.dart';
import 'package:graduation_project/view/widgets/productDetails/image_sliders.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final int id;
  final String image;
  final String desc;
  final String price;
   ProductDetailsScreen({Key? key,
    required this.title,required this.id,
    required this.image,required this.desc,required this.price})
      : super(key: key);
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode?pinkClr:mainColor,
          title: TextUtils(
            underLine: TextDecoration.none,
            fontSize: 20,
            fontWeight: FontWeight.normal,
            text: 'Details Product',
            color: Colors.white,
          ),
          centerTitle: true,
          actions: [
            Obx(
                  () => Badge(
                position: BadgePosition.topEnd(top: 0, end: 0),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.cardScreen);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: image,
              ),
              ClothesInfo(
                title: title,
                productId: id,
                rate: 4.5,
                description: desc,
              ),
              AddCart(
                price: price,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
