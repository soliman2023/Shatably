
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/routes/routes.dart';
class NameScreen extends StatelessWidget {
  final bool isLogin;

  const NameScreen({Key? key,required this.isLogin,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [

         Text(
          isLogin ?'loginTitle'.tr:'signUpTitle'.tr,
          style:  TextStyle(
              fontSize: 35,
              color: Get.isDarkMode?Colors.white:Colors.black,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 9,
        ),
        Text( isLogin?'loginSubTitle'.tr:'signUpSubTitle'.tr,
    textAlign: TextAlign.center,
    style: const TextStyle(
    color: Color(0XFF969195),
    fontWeight: FontWeight.bold,
    fontSize: 18)),
        SizedBox(
          height: size.height * 0.05,
        ),
      ],
    );
  }
}

class TextUnderSpan extends StatelessWidget {
  final bool isLogin;
  const TextUnderSpan({Key? key,required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
          TextSpan(
              text: isLogin?'goSignUp'.tr:'goLogin'.tr,
              style:  TextStyle(
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),

          TextSpan(
              text: isLogin?'signUpGoButton'.tr:'loginGoButton'.tr,
              recognizer: TapGestureRecognizer()
                ..onTap = () =>isLogin? Get.offNamed(Routes.signup):
                Get.offNamed(Routes.login),
              style: const TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
        ]));
  }
}

