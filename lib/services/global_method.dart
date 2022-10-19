import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalHandlingError{
  static showSnackBarError({
    required String title,
    required String message,
}){
    Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode?Colors.grey:Colors.white,
        colorText: Colors.black,
        isDismissible: true,
        icon: const Icon(Icons.warning_amber_outlined,color: Colors.red,)
    );
  }

  static showErrorDialog({required String error,required BuildContext context}){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Icon(Icons.error,color: Colors.red,),
                SizedBox(width: 5,),
                Text('error'.tr,style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic
                ),),
              ],
            ),
            content: Text(error,
              style: const TextStyle(
                  fontSize: 18,
              ),),
            actions: [
              TextButton(onPressed: (){
                Navigator.canPop(context)?Navigator.pop(context):null;
              },
                  child: Text('ok'.tr,
                    style: TextStyle(
                        color: Colors.red
                    ),))
            ],
          );

        }

    );
  }



}