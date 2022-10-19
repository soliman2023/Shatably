import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ShowSignUpDialog{

   static showTheDialog({required BuildContext context,
  required String title,
  required Widget widget,
   }){
    var size=MediaQuery.of(context).size;
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text(title,
          style: TextStyle(
              color: Get.isDarkMode?Colors.pink:Colors.deepOrange,
              fontSize: 20
          ),),
        content: SizedBox(
          width: size.width*0.9,
          child: widget,
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.canPop(context)?Navigator.pop(context):null;
          },
              child: Text('cancel'.tr,)),
        ],
      );
    });
}
}

class ContactDialog extends StatelessWidget {
  final IconData icons;
  final String text;
   ContactDialog({Key? key,required this.icons,required  this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icons,
          color: Colors.red[200],),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,
              maxLines: 2,
              overflow: TextOverflow.visible,
              softWrap: true,
              style: TextStyle(
                fontSize: 18,
                color: Get.isDarkMode?Colors.deepOrange:const Color(0xFF00325A),
                fontStyle: FontStyle.italic,
              ),),
          ),
        )
      ],
    );
  }
}
