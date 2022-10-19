
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpButtons extends StatelessWidget {
  final Function() onTap;
  final bool isLogin;
  const SignUpButtons({Key? key,required this.onTap, this.isLogin=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        )),
        backgroundColor: MaterialStateProperty.all(  Get.isDarkMode?Colors.pink:Colors.deepOrange),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15,horizontal: 40)),
        elevation: MaterialStateProperty.all(10.0),

      ),
      child: Text(
        isLogin?'LoginButton'.tr:'signUpButton'.tr,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}



class AccountButtons extends StatelessWidget {
  final Function() onTap;
  final IconData icons;
  final Color color;
  final String text;
  const AccountButtons({Key? key,required this.onTap,required this.icons,required this.color,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          )),
          backgroundColor: MaterialStateProperty.all(color),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15,horizontal: 20)),
          elevation: MaterialStateProperty.all(10.0),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icons,color: Colors.white,size: 25,),
            const SizedBox(width: 10,),
            Text(text,style: const TextStyle(
              //fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),)

          ],
        ),
      ),
    );
  }
}


