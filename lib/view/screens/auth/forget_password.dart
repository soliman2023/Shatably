
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/view/widgets/auth/text_form_refactor.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({Key? key}) : super(key: key);



   final TextEditingController _emailController=TextEditingController(text: '');
   final controller = Get.find<AuthController>();

  submitForgetPassword(){
    controller.resetPassword(_emailController.text);
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Lottie.asset('assets/image/forgetpass.json',
                    height: 180,
                    repeat: true,
                    reverse: true),
                SizedBox(height: size.height*0.1,),
                 Text('forgetPassword'.tr,style: TextStyle(
                    fontSize: 30,color: Get.isDarkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 20,),
                TextRefactorFiled(
                  prefixIcon: Icons.email,
                  controller:_emailController ,
                  editingComplete: (){},
                  hintText: 'email'.tr,
                  onValid: (value){
                    if(value!.isEmpty||!value.contains('@')){
                      return 'vEmail'.tr;
                    }
                  },
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height:30 ,),
                GetBuilder<AuthController>(builder: (_){
                  return MaterialButton(
                    onPressed: submitForgetPassword,
                    color: Get.isDarkMode?Colors.pink:Colors.deepOrange,
                    elevation: 10.0,
                    minWidth: double.infinity,
                    padding:const  EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  Text('resetNow'.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),

                  );
                })


              ],
            ),
          ),
        ),
      ),
    );
  }
}
