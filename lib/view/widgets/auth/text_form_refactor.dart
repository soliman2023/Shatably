
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextRefactorFiled extends StatelessWidget {
   FocusNode? focusNode;
  final IconData prefixIcon;
  final TextEditingController controller;
  final Function()? editingComplete;
  final Function()? onTapShowText;
  final String hintText;
  final bool?  showText;
  final bool?  enable;
  final int? maxLine;
  final TextInputType inputType;
  final String? Function(String?) onValid;
   TextRefactorFiled({Key? key,
     this.focusNode,
    required this.controller,
     this.editingComplete,
    this.onTapShowText,
    required this.hintText,
    this.showText,
    required this.inputType,
    required  this.onValid,
    this.enable,required this.prefixIcon,
   this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine??1,
      focusNode: focusNode,
      textInputAction: TextInputAction.done,
      onEditingComplete: editingComplete,
      controller: controller,
      style: TextStyle(
        color: Get.isDarkMode?Colors.white:Colors.black,
      ),
      keyboardType: inputType,
      validator: onValid,
      obscureText: showText??false,
      decoration: InputDecoration(
    suffixIcon: showText==null?null:GestureDetector(
    onTap: onTapShowText,
    child: Icon(showText??false?Icons.visibility:Icons.visibility_off,color: Colors.grey,)),
    enabled: enable??true,
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0XFF8F8F8F),
          fontWeight: FontWeight.normal,
          fontSize: 18
        ),
         //prefixIconColor: Get.isDarkMode?Colors.pink:Colors.deepOrange,
         prefixIcon:Icon(prefixIcon,color:Get.isDarkMode?Colors.pink:Colors.deepOrange ,) ,
         fillColor: Get.isDarkMode?Colors.grey.shade900:Colors.grey.shade300,
        filled: true,
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(12)
         ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.deepOrange),
        ),
        disabledBorder:   OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white,),
        ),
        errorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.pink,
              width: 1),
        ),
      ),
    );
  }
}
