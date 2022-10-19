
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/view/widgets/auth/buttons.dart';
import 'package:graduation_project/view/widgets/auth/name_screen.dart';
import 'package:graduation_project/view/widgets/auth/text_form_refactor.dart';
import 'forget_password.dart';
import 'package:lottie/lottie.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  late final TextEditingController _emailController=TextEditingController(text: '');
 late final  TextEditingController _passController=TextEditingController(text: '');
  final FocusNode _emailFocusNode=FocusNode();
  final FocusNode _passFocusNode=FocusNode();
 var loginKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    submitLogin(){

      bool isValid=loginKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if(isValid){
        controller.logInUsingFirebase(
            email: _emailController.text,
            password: _passController.text);
      }else{
        print('The Email is not valid');
      }

    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset('assets/image/login.json',
               height: 180,
               repeat: false,
                reverse: true),
                const NameScreen(isLogin: true,),
                Form(
                  key: loginKey,
                  child: Column(
                    children: [
                      TextRefactorFiled(
                        prefixIcon: FontAwesomeIcons.user,
                        controller:_emailController ,
                        focusNode: _emailFocusNode,
                        editingComplete: ()=>FocusScope.of(context).requestFocus(_passFocusNode),
                        hintText: 'email'.tr,
                        onValid: (value){
                          if(value!.isEmpty||!value.contains('@')){
                            return 'vEmail'.tr;
                          }
                        },
                        inputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height:10 ,),
                      GetBuilder<AuthController>(builder: (_){
                        return TextRefactorFiled(
                          prefixIcon: FontAwesomeIcons.lock,
                          controller:_passController ,
                          focusNode: _passFocusNode,
                          editingComplete: submitLogin,
                          hintText: 'password'.tr,
                          onValid:  (value){
                            if(value!.isEmpty||value.length<8){
                              return 'vPassword'.tr;
                            }
                          },
                          inputType: TextInputType.visiblePassword,
                          showText: controller.isVisible,
                          onTapShowText: (){
                            controller.visibility();
                          } ,
                        );
                      }),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: ()=>Get.to(ForgetPasswordScreen()),
                    child: Text('forgetPassword'.tr,
                    style: TextStyle(
                      color: Get.isDarkMode?Colors.white:Colors.black,
                      fontSize: 18,
                    ),),
                  ),
                ),
                GetBuilder<AuthController>(builder: (_){
                  return SignUpButtons(onTap: submitLogin,
                    isLogin: true,);
                }),
                const SizedBox(height:15 ,),
                 Text('orConnectUser'.tr,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0XFF969195),
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height:15 ,),
                Row(
                  children: [
                  Expanded(child: AccountButtons(
                    color: Colors.blueAccent,onTap: (){},
                    text: 'faceBook'.tr,icons: FontAwesomeIcons.facebook,
                  )),
                  Expanded(child:
                  GetBuilder<AuthController>(builder: (_){
                    return AccountButtons(color: Colors.redAccent,
                      onTap: (){
                      controller.googleSignIn;
                      },text: 'google'.tr,
                      icons: FontAwesomeIcons.google,);
                  })
                  ),
                  ],
                ),
                const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.0),
                  child:   Align(
                    alignment: Alignment.bottomCenter,
                    child: TextUnderSpan(isLogin: true),
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
