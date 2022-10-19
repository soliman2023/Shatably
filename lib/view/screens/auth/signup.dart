import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/services/global_method.dart';
import 'package:graduation_project/units/constants.dart';
import 'package:graduation_project/view/widgets/auth/buttons.dart';
import 'package:graduation_project/view/widgets/auth/choose_image.dart';
import 'package:graduation_project/view/widgets/auth/name_screen.dart';
import 'package:graduation_project/view/widgets/auth/show_dialog.dart';
import 'package:graduation_project/view/widgets/auth/text_form_refactor.dart';

class ClientSignUpScreen extends StatelessWidget {
  ClientSignUpScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passController = TextEditingController(text: '');
  final TextEditingController _confirmPassController =
      TextEditingController(text: '');
  final TextEditingController _phoneController =
      TextEditingController(text: '');

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passFocusNode = FocusNode();
  final FocusNode _confirmPassFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _locationFocusNode = FocusNode();
  final FocusNode _birthDayFocusNode = FocusNode();
  final FocusNode _typeAccountFocusNode = FocusNode();
  final FocusNode _jopFocusNode = FocusNode();
  var signUpKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    submitSignUp() {
      bool isValid = signUpKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if (isValid) {
        if (controller.fileImage != null) {
          if (_passController.text == _confirmPassController.text) {
            controller.signUpUsingFirebase(
                name: _nameController.text,
                email: _emailController.text,
                password: _passController.text,
                phoneNumber: _phoneController.text,
                file: controller.fileImage!
            );
          } else {
            GlobalHandlingError.showErrorDialog(error: 'passwordNotConfirm'.tr, context: context);

          }
        } else {
          GlobalHandlingError.showErrorDialog(error: 'pleaseImage'.tr, context: context);
        }
      }
      else {
        GlobalHandlingError.showErrorDialog(error: 'pleaseFiled'.tr, context: context);

      }
    }
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                const NameScreen(
                  isLogin: false,
                ),
                Form(
                  key: signUpKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: TextRefactorFiled(
                              prefixIcon: Icons.perm_identity_rounded,
                              focusNode: _nameFocusNode,
                              controller: _nameController,
                              hintText: 'name'.tr,
                              editingComplete: () => FocusScope.of(context)
                                  .requestFocus(_emailFocusNode),
                              inputType: TextInputType.name,
                              onValid: ((value) {
                                if (value!.isEmpty) {
                                  return 'vName'.tr;
                                }
                              }),
                            ),
                          ),
                          Flexible(
                            child: GetBuilder<AuthController>(builder: (_) {
                              return ChooseImage(
                                controller: controller,
                              );
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextRefactorFiled(
                        prefixIcon: Icons.email,
                        focusNode: _emailFocusNode,
                        controller: _emailController,
                        hintText: 'email'.tr,
                        editingComplete: () =>
                            FocusScope.of(context).requestFocus(_passFocusNode),
                        inputType: TextInputType.emailAddress,
                        onValid: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'vEmail'.tr;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return TextRefactorFiled(
                          prefixIcon: Icons.lock,
                          focusNode: _passFocusNode,
                          controller: _passController,
                          hintText: 'password'.tr,
                          editingComplete: () => FocusScope.of(context)
                              .requestFocus(_confirmPassFocusNode),
                          inputType: TextInputType.visiblePassword,
                          onValid: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return 'vPassword'.tr;
                            }
                          },
                          showText: controller.isVisible,
                          onTapShowText: () {
                            controller.visibility();
                          },
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return TextRefactorFiled(
                          prefixIcon: Icons.password,
                          controller: _confirmPassController,
                          focusNode: _confirmPassFocusNode,
                          editingComplete: () => FocusScope.of(context)
                              .requestFocus(_phoneFocusNode),
                          hintText: 'confirmPassword'.tr,
                          inputType: TextInputType.visiblePassword,
                          onValid: (value) {
                            if (value!.isEmpty || value.length < 8) {
                              return 'vConfirmPassword'.tr;
                            }
                          },
                          showText: controller.isVisibleConfirm,
                          onTapShowText: () {
                            controller.visibilityConfirm();
                          },
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextRefactorFiled(
                        prefixIcon: Icons.phone,
                        controller: _phoneController,
                        focusNode: _phoneFocusNode,
                        editingComplete: () => FocusScope.of(context)
                            .requestFocus(_locationFocusNode),
                        hintText: 'phoneNumber'.tr,
                        inputType: TextInputType.phone,
                        onValid: (value) {
                          if (value!.isEmpty || value.length != 11) {
                            return 'vPhoneNumber'.tr;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return Row(
                          children: [
                            Flexible(
                              flex: 6,
                              child: TextRefactorFiled(
                                prefixIcon: Icons.location_on,
                                controller: controller.locationController,
                                focusNode: _locationFocusNode,
                                editingComplete: () => FocusScope.of(context)
                                    .requestFocus(_birthDayFocusNode),
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
                                      ? Colors.pink
                                      : Colors.deepOrange,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            controller.sumOfAge(context);
                            FocusScope.of(context)
                                .requestFocus(_typeAccountFocusNode);
                          },
                          child: TextRefactorFiled(
                            prefixIcon: FontAwesomeIcons.birthdayCake,
                            controller: controller.birthDayController,
                            focusNode: _birthDayFocusNode,
                            editingComplete: () => FocusScope.of(context)
                                .requestFocus(_birthDayFocusNode),
                            hintText: 'birthday'.tr,
                            inputType: TextInputType.text,
                            enable: false,
                            onValid: (value) {
                              if (value!.isEmpty) {
                                return 'vBirthday'.tr;
                              }
                            },
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            ShowSignUpDialog.showTheDialog(
                                context: context,
                                title: 'typeAccount'.tr,
                                widget: ListView.builder(
                                    itemCount: Constants.typeAccount.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          controller.chooseTypeAccount(
                                              Constants.typeAccount[index]);
                                        },
                                        child: ContactDialog(
                                          icons: Icons.email_outlined,
                                          text: Constants.typeAccount[index],
                                        ),
                                      );
                                    }));
                            FocusScope.of(context).requestFocus(_jopFocusNode);
                          },
                          child: TextRefactorFiled(
                            prefixIcon: Icons.merge_type,
                            controller: controller.typeAccountController,
                            focusNode: _typeAccountFocusNode,
                            editingComplete: () => FocusScope.of(context)
                                .requestFocus(_typeAccountFocusNode),
                            hintText: 'typeAccount'.tr,
                            inputType: TextInputType.text,
                            enable: false,
                            onValid: (value) {
                              if (value!.isEmpty) {
                                return 'vTypeAccount'.tr;
                              }
                            },
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return controller.isWorker
                            ? GestureDetector(
                                onTap: () {
                                  ShowSignUpDialog.showTheDialog(
                                      context: context,
                                      title: 'workerJop'.tr,
                                      widget: ListView.builder(
                                          itemCount: Constants.worker.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                controller.chooseWorker(
                                                    Constants.worker[index]);
                                              },
                                              child: ContactDialog(
                                                icons: Icons.work,
                                                text: Constants.worker[index],
                                              ),
                                            );
                                          }));
                                },
                                child: TextRefactorFiled(
                                  prefixIcon: Icons.work,
                                  controller: controller.jopController,
                                  focusNode: _jopFocusNode,
                                  editingComplete: submitSignUp,
                                  hintText: 'Jop Category',
                                  inputType: TextInputType.text,
                                  enable: false,
                                  onValid: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please validator The Jop Category';
                                    }
                                  },
                                ),
                              )
                            : controller.isShop
                                ? GestureDetector(
                                    onTap: () {
                                      ShowSignUpDialog.showTheDialog(
                                          context: context,
                                          title: 'shopProductType'.tr,
                                          widget: ListView.builder(
                                              itemCount: Constants.shop.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    controller.chooseWorker(
                                                        Constants.shop[index]);
                                                  },
                                                  child: ContactDialog(
                                                    icons: Icons.shopping_cart,
                                                    text: Constants.shop[index],
                                                  ),
                                                );
                                              }));
                                    },
                                    child: TextRefactorFiled(
                                      prefixIcon: Icons.shop,
                                      controller: controller.jopController,
                                      focusNode: _jopFocusNode,
                                      editingComplete: submitSignUp,
                                      hintText: 'jopCategory'.tr,
                                      inputType: TextInputType.text,
                                      enable: false,
                                      onValid: (value) {
                                        if (value!.isEmpty) {
                                          return 'vJopCategory'.tr;
                                        }
                                      },
                                    ),
                                  )
                                : (controller.isClient || controller.isCompany)
                                    ? TextRefactorFiled(
                                        prefixIcon: FontAwesomeIcons.joget,
                                        controller: controller.jopController,
                                        focusNode: _jopFocusNode,
                                        editingComplete: submitSignUp,
                                        hintText: 'jopCategory'.tr,
                                        inputType: TextInputType.text,
                                        onValid: (value) {
                                          if (value!.isEmpty) {
                                            return 'vJopCategory'.tr;
                                          }
                                        },
                                      )
                                    : Container();
                      }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return SignUpButtons(
                    onTap: submitSignUp,
                  );
                }),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextUnderSpan(isLogin: false),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
