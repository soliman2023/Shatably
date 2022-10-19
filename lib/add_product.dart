
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/product_controller.dart';
import 'package:graduation_project/services/global_method.dart';
import 'package:graduation_project/units/constants.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/auth/choose_image.dart';
import 'package:graduation_project/view/widgets/auth/show_dialog.dart';
import 'package:graduation_project/view/widgets/auth/text_form_refactor.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';

class AddProduct extends StatelessWidget {

  final productKey = GlobalKey<FormState>();
  final controller=Get.put(ProductController());

  final FocusNode titleFocusNode = FocusNode();
  final FocusNode decsFocusNode = FocusNode();
  final FocusNode priceFocusNode = FocusNode();
  final FocusNode productCategoryFocusNode = FocusNode();
  final FocusNode productTypeFocusNode = FocusNode();
  final FocusNode rateFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;

    void createProduct() async {
      bool isValid = productKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (isValid) {
        if (controller.fileImage != null) {
          controller.createProduct();
        } else {
          GlobalHandlingError.showErrorDialog(error: 'Please enter the image', context: context);
        }
      }
      else {
        GlobalHandlingError.showErrorDialog(error: 'Please fill any filed', context: context);
      }

    }

    return Scaffold(
      backgroundColor: Get.isDarkMode?backDark:Colors.white,
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
      body: SingleChildScrollView(
        child: Form(
          key: productKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<ProductController>(builder: (_) {
                      return ChooseImage(
                        controller: controller,
                      );
                    }),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextRefactorFiled(
                  prefixIcon:Icons.title,
                  controller: controller.titleProductController,
                  focusNode: titleFocusNode,
                  editingComplete: () => FocusScope.of(context)
                      .requestFocus(decsFocusNode),
                  hintText: 'Title Product',
                  inputType: TextInputType.text,
                  onValid: (value) {
                    if (value!.isEmpty) {
                      return 'Please validator The Title Product';
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextRefactorFiled(
                  prefixIcon:Icons.description,
                  controller: controller.descProductController,
                  focusNode: decsFocusNode,
                  editingComplete: () => FocusScope.of(context)
                      .requestFocus(productCategoryFocusNode),
                  hintText: 'Description Product',
                  inputType: TextInputType.text,
                  onValid: (value) {
                    if (value!.isEmpty) {
                      return 'Please validator The Description Product';
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<ProductController>(builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      ShowSignUpDialog.showTheDialog(context: context,
                          title: 'Choose Product Category',
                          widget: ListView.builder(
                              itemCount: Constants.ProductCategoryType.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.productCategoryController.text=Constants.ProductCategoryType[index];
                                    Get.back();
                                  },
                                  child: ContactDialog(
                                    icons: Icons.category,
                                    text: Constants.ProductCategoryType[index],
                                  ),
                                );
                              }));
                      FocusScope.of(context)
                          .requestFocus(productTypeFocusNode);
                    },
                    child: TextRefactorFiled(
                      prefixIcon:FontAwesomeIcons.building,
                      controller: controller.productCategoryController,
                      focusNode: productCategoryFocusNode,
                      editingComplete: () => FocusScope.of(context)
                          .requestFocus(productTypeFocusNode),
                      hintText: 'Product Category',
                      inputType: TextInputType.text,
                      enable: false,
                      onValid: (value) {
                        if (value!.isEmpty) {
                          return 'Please validator The Product Category';
                        }
                      },
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<ProductController>(builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      ShowSignUpDialog.showTheDialog(context: context,
                          title: 'Choose Product Type',
                          widget: ListView.builder(
                              itemCount: Constants.ProductType.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.productTypeController.text=Constants.ProductType[index];
                                    Get.back();
                                  },
                                  child: ContactDialog(
                                    icons: Icons.merge_type,
                                    text: Constants.ProductType[index],
                                  ),
                                );
                              }));
                      FocusScope.of(context)
                          .requestFocus(priceFocusNode);
                    },
                    child: TextRefactorFiled(
                      prefixIcon:Icons.merge_type,
                      controller: controller.productTypeController,
                      focusNode: productTypeFocusNode,
                      editingComplete: () => FocusScope.of(context)
                          .requestFocus(priceFocusNode),
                      hintText: 'Product Type',
                      inputType: TextInputType.text,
                      enable: false,
                      onValid: (value) {
                        if (value!.isEmpty) {
                          return 'Please validator The Product Type';
                        }
                      },
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                TextRefactorFiled(
                  prefixIcon:Icons.price_check,
                  controller: controller.priceProductController,
                  focusNode: priceFocusNode,
                  editingComplete: () => createProduct(),
                  hintText: 'Price Product',
                  inputType: TextInputType.number,
                  onValid: (value) {
                    if (value!.isEmpty) {
                      return 'Please validator The Price Product';
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<ProductController>(builder: (_){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: (controller.isAddLoading)?
                    Center(child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Get.isDarkMode?Colors.pink:Colors.deepOrange, //<-- SEE HERE
                      ),
                    ),):
                    MaterialButton(
                      onPressed: (){
                        createProduct();
                      },
                      color: Get.isDarkMode?pinkClr:mainColor,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical:  10),

                      child:  const Text('انشاء منتج',style:  TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                    ),
                  );
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

