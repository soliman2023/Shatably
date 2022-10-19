
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/logic/controllers/order_controller.dart';
import 'package:graduation_project/services/global_method.dart';
import 'package:graduation_project/units/constants.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/auth/choose_image.dart';
import 'package:graduation_project/view/widgets/auth/show_dialog.dart';
import 'package:graduation_project/view/widgets/auth/text_form_refactor.dart';


class CreateOrdersScreen extends StatelessWidget {
  CreateOrdersScreen({Key? key}) : super(key: key);

  final orderKey = GlobalKey<FormState>();
 final authController=Get.find<AuthController>();
  final controller=Get.put(OrderController());


  final FocusNode taskTypeFocusNode = FocusNode();
  final FocusNode requiredTaskFocusNode = FocusNode();
  final FocusNode taskCategoryFocusNode = FocusNode();
  final FocusNode workerFocusNode = FocusNode();
  final FocusNode priceFocusNode = FocusNode();
  final FocusNode detailsFocusNode = FocusNode();
  final FocusNode locationFocusNode = FocusNode();
  final FocusNode comWayFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;
    authController.getDateUsers();

    void createOrder() async {
      bool isValid = orderKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (isValid) {
        if (controller.fileImage0 != null) {
          controller.createOrder();
        } else {
          GlobalHandlingError.showErrorDialog(error: 'pleaseImage'.tr, context: context);
        }
      }
      else {
        GlobalHandlingError.showErrorDialog(error: 'pleaseFiled'.tr, context: context);
      }

    }
    return Scaffold(
      backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: orderKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Flexible(
                      child: GetBuilder<OrderController>(builder: (_) {
                        return ChooseOrderImage(
                          index: 0,
                          controller: controller,
                        );
                      }),
                    ),
                    Flexible(
                      child: GetBuilder<OrderController>(builder: (_) {
                        return ChooseOrderImage(
                          index: 1,
                          controller: controller,
                        );
                      }),
                    ),
                    Flexible(
                      child: GetBuilder<OrderController>(builder: (_) {
                        return ChooseOrderImage(
                          index: 2,
                          controller: controller,
                        );;
                      }),
                    ),
                    Flexible(
                      child: GetBuilder<OrderController>(builder: (_) {
                        return ChooseOrderImage(
                          index: 3,
                          controller: controller,
                        );
                      }),
                    ),
                  ],
                ),
                GetBuilder<OrderController>(builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      ShowSignUpDialog.showTheDialog(context: context,
                          title: 'chooseTaskType'.tr,
                          widget: ListView.builder(
                              itemCount: Constants.taskType.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.orderTaskType(Constants.taskType[index]);
                                  },
                                  child: ContactDialog(
                                    icons: FontAwesomeIcons.listCheck,
                                    text: Constants.taskType[index],
                                  ),
                                );
                              }));
                      FocusScope.of(context)
                          .requestFocus(requiredTaskFocusNode);
                    },
                    child: TextRefactorFiled(
                      prefixIcon:FontAwesomeIcons.listCheck,
                      controller: controller.taskTypeController,
                      focusNode: taskTypeFocusNode,
                      editingComplete: () => FocusScope.of(context)
                          .requestFocus(taskTypeFocusNode),
                      hintText: 'taskType'.tr,
                      inputType: TextInputType.text,
                      enable: false,
                      onValid: (value) {
                        if (value!.isEmpty) {
                          return 'vTaskType'.tr;
                        }
                      },
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                TextRefactorFiled(
                  prefixIcon:FontAwesomeIcons.diagramNext,
                  controller: controller.requiredTaskController,
                  focusNode: requiredTaskFocusNode,
                  editingComplete: () => FocusScope.of(context)
                      .requestFocus(taskCategoryFocusNode),
                  hintText: 'requiredTask'.tr,
                  inputType: TextInputType.text,
                  maxLine: 4,
                  onValid: (value) {
                    if (value!.isEmpty) {
                      return 'vRequiredTask'.tr;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<OrderController>(builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      ShowSignUpDialog.showTheDialog(context: context,
                          title: 'chooseOrderCategory'.tr,
                          widget: ListView.builder(
                              itemCount: Constants.orderCategoryType.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.orderChooseCategory(Constants.orderCategoryType[index]);
                                  },
                                  child: ContactDialog(
                                    icons: FontAwesomeIcons.building,
                                    text: Constants.orderCategoryType[index],
                                  ),
                                );
                              }));
                      controller.isCategoryWorker?FocusScope.of(context)
                          .requestFocus(workerFocusNode):
                      FocusScope.of(context)
                          .requestFocus(priceFocusNode);
                    },
                    child: TextRefactorFiled(
                      prefixIcon:FontAwesomeIcons.building,
                      controller: controller.taskCategoryController,
                      focusNode: taskCategoryFocusNode,
                      editingComplete: () => FocusScope.of(context)
                          .requestFocus(taskCategoryFocusNode),
                      hintText: 'taskCategory'.tr,
                      inputType: TextInputType.text,
                      enable: false,
                      onValid: (value) {
                        if (value!.isEmpty) {
                          return 'vTaskCategory'.tr;
                        }
                      },
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                controller.isCategoryWorker?
                GetBuilder<OrderController>(builder: (_) {
                  return GestureDetector(
                    onTap: () {
                      ShowSignUpDialog.showTheDialog(context: context,
                          title: 'Choose Worker',
                          widget: ListView.builder(
                              itemCount: Constants.worker.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    controller.orderIsWorker(Constants.worker[index]);
                                  },
                                  child: ContactDialog(
                                    icons: FontAwesomeIcons.userInjured,
                                    text: Constants.worker[index],
                                  ),
                                );
                              }));
                      FocusScope.of(context)
                          .requestFocus(priceFocusNode);
                    },
                    child: TextRefactorFiled(
                      prefixIcon:FontAwesomeIcons.userInjured,
                      controller: controller.workerNameController,
                      focusNode: taskCategoryFocusNode,
                      editingComplete: () => FocusScope.of(context)
                          .requestFocus(taskCategoryFocusNode),
                      hintText: 'workerJop'.tr,
                      inputType: TextInputType.text,
                      enable: false,
                      onValid: (value) {
                        if (value!.isEmpty) {
                          return 'vWorkerJop'.tr;
                        }
                      },
                    ),
                  );
                }):
                Container(),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<OrderController>(builder: (_) {
                  return Row(
                    children: [
                      Flexible(
                        flex: 5,
                        child: TextRefactorFiled(
                          prefixIcon:FontAwesomeIcons.moneyBill,
                          controller: controller.priceController,
                          focusNode: priceFocusNode,
                          editingComplete: () => FocusScope.of(context)
                              .requestFocus(detailsFocusNode),
                          hintText: 'price'.tr,
                          enable: controller.isPrice?false:true,
                          inputType: TextInputType.number,
                          onValid: (value) {
                            if (value!.isEmpty) {
                              return 'vPrice'.tr;
                            }
                          },
                        ),
                      ),
                      Flexible(
                         flex: 2,
                        child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ElevatedButton(
                          onPressed: (){
                            controller.isPrice?controller.priceController.text='':controller.priceController.text='من قبل الجهه المنفذه';
                            controller.orderPrice();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                            backgroundColor: MaterialStateProperty.all(Get.isDarkMode?pinkClr:mainColor),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10,horizontal: 10)),
                            elevation: MaterialStateProperty.all(10.0),

                          ),
                          child:  Text(!controller.isPrice?'uponAgree'.tr:'cancel'.tr,style:const  TextStyle(
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),),
                        ),
                      ),)
                    ],
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                TextRefactorFiled(
                  prefixIcon:FontAwesomeIcons.readme,
                  controller: controller.detailsTaskController,
                  focusNode: detailsFocusNode,
                  editingComplete: () => FocusScope.of(context)
                      .requestFocus(locationFocusNode),
                  hintText: 'detailsTask'.tr,
                  inputType: TextInputType.text,
                  maxLine: 6,
                  onValid: (value) {
                    if (value!.isEmpty) {
                      return 'vDetailsTask'.tr;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<OrderController>(builder: (_) {
                  return Row(
                    children: [
                      Flexible(
                        flex: 6,
                        child: TextRefactorFiled(
                          prefixIcon: Icons.location_on,
                          controller: controller.locationController,
                          focusNode: locationFocusNode,
                          editingComplete: () => FocusScope.of(context)
                              .requestFocus(comWayFocusNode),
                          hintText: 'location'.tr,
                          inputType: TextInputType.phone,
                          onValid: (value) {
                            if (value!.isEmpty) {
                              return 'vLocation'.tr;
                            }
                          },
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          onPressed: () {
                            controller.dynamicLocation();
                          },
                          icon: Icon(
                            Icons.location_on,
                            size: 30,
                            color: Get.isDarkMode
                                ? pinkClr
                                : mainColor,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<OrderController>(builder: (_) {
                  return Row(
                    children: [
                      Flexible(
                        flex: 6,
                        child: TextRefactorFiled(
                          prefixIcon: Icons.phone,
                          controller: controller.wayToCommunicateController,
                          focusNode: comWayFocusNode,
                          editingComplete: createOrder,
                          hintText: 'phoneNumber'.tr,
                          inputType: TextInputType.phone,
                          onValid: (value) {
                            if (value!.isEmpty || value.length!=11) {
                              return 'vPhoneNumber'.tr;
                            }
                          },
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          onPressed: () {
                            controller.dynamicPhoneNumber(authController.userPhoneNumber);
                          },
                          icon: Icon(
                            Icons.phone_android,
                            size: 30,
                            color: Get.isDarkMode
                                ? pinkClr
                                : mainColor,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
                GetBuilder<OrderController>(builder: (_){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: (controller.isLoading)?
                     Center(child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Get.isDarkMode?Colors.pink:Colors.deepOrange, //<-- SEE HERE
                      ),
                    ),):
                    MaterialButton(
                      onPressed: (){
                        createOrder();
                      },
                      color: Get.isDarkMode?pinkClr:mainColor,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical:  10),
                      child:   Text('createOrder'.tr,style:  TextStyle(
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



