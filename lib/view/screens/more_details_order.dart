
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/units/constants.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/more/buttons.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';

class MoreDetailOrder extends StatelessWidget {
  final String imageUrl;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;
  final String orderId;
  final DateTime createdAt;
  final String taskType;
  final String requiredType;
  final String details;
  final String price;
  final String taskCategory;
  final String worker;
  final String location;
  final String userId;
  final String userName;
  final String userImage;
  final String userJop;
  const MoreDetailOrder({Key? key,required this.imageUrl,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.imageUrl4,
    required this.orderId,
    required this.createdAt,
    required this.taskType,
    required this.requiredType,
    required this.details,
    required this.price,
    required this.taskCategory,
    required this.worker,
    required this.location,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.userJop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode?pinkClr:mainColor,
        foregroundColor: Colors.white,
        title:  Text('orderDetails'.tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: imageUrl =='' ?
                        Image.network(
                          urlImageSignUp,
                          fit: BoxFit.fill,
                        )
                            : Image.network(imageUrl, fit: BoxFit.fill,
                        )
                        ,
                      ),
                    ),
                  ),
                  Expanded(
                    child:imageUrl2 ==''? Container():Container(
                      margin: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.width * 0.2,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: imageUrl2 =='' ?
                        Image.network(
                          urlImageSignUp,
                          fit: BoxFit.fill,
                        )
                            : Image.network(imageUrl2, fit: BoxFit.fill,
                        )
                        ,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: imageUrl3 ==''? Container():Container(
                      margin: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.width * 0.2,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: imageUrl3 =='' ?
                        Image.network(
                          urlImageSignUp,
                          fit: BoxFit.fill,
                        )
                            : Image.network(imageUrl2, fit: BoxFit.fill,
                        )
                        ,
                      ),
                    ),
                  ),
                  Expanded(
                    child: imageUrl4 ==''? Container():Container(
                      margin: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.width * 0.2,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: imageUrl4 =='' ?
                        Image.network(
                          urlImageSignUp,
                          fit: BoxFit.fill,
                        )
                            : Image.network(imageUrl2, fit: BoxFit.fill,
                        )
                        ,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Get.isDarkMode?Colors.white:Colors.grey,
                thickness: 2,
                height: 30,
              ),
              RichTextUtils(mainText: 'Order ID : ', normalText: orderId,),
              const SizedBox(height: 5,),
              RichTextUtils(mainText: 'createdAt'.tr+' : ', normalText: '$createdAt',),
              Divider(
                color: Get.isDarkMode?Colors.white:Colors.grey,
                thickness: 2,
                height: 30,
              ),
              TextUtils(
                color: Get.isDarkMode?pinkClr:mainColor,
                fontSize: 25,
                text: 'moreDetails'.tr,
                fontWeight: FontWeight.bold,
                underLine:TextDecoration.none,
              ),
              const SizedBox(height: 5,),
              RichTextUtils(mainText: 'taskType'.tr +' : ', normalText: taskType,),
              const SizedBox(height: 5,),
              RichTextUtils(mainText: 'requiredTask'.tr +' : \n', normalText: requiredType,),
              const SizedBox(height: 5,),
              RichTextUtils(mainText: 'detailsTask'.tr + ' : \n', normalText: details,),
              const SizedBox(height: 5,),
              RichTextUtils(mainText: 'price'.tr + ' : ', normalText: price,),
              const SizedBox(height: 5,),
              RichTextUtils(mainText: 'taskCategory'.tr + ' : ', normalText: taskCategory,),
              const SizedBox(height: 5,),
              RichTextUtils(mainText: 'chooseWorker'.tr + ' : ', normalText: worker,),
              const SizedBox(height: 5,),
              RichTextUtils(mainText: 'location'.tr + ' : ', normalText: location,),
              Divider(
                color: Get.isDarkMode?Colors.white:Colors.grey,
                thickness: 2,
                height: 30,
              ),
              TextUtils(
                color: Get.isDarkMode?pinkClr:mainColor,
                fontSize: 25,
                text: 'infoClient'.tr,
                fontWeight: FontWeight.bold,
                underLine:TextDecoration.none,
              ),
              const SizedBox(height: 5,),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(userImage,),
                    onBackgroundImageError:(Object, StackTrace){
                      NetworkImage(urlImageSignUp,);
                    } ,
                    //foregroundImage: NetworkImage(urlImageSignUp),
                    maxRadius: 40,
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextUtils(
                          color: Get.isDarkMode?Colors.pink:Colors.deepOrange,
                          text: userName,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          underLine: TextDecoration.none,
                        ),
                        TextUtils(
                          color: Get.isDarkMode?Colors.white:Colors.black,
                          text: userJop,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  IconButton(
                    onPressed: (){
                      showDialog(context: context,
                          barrierColor: Colors.black12,
                          barrierDismissible: false,
                          useSafeArea: true,
                          builder: (context)=>
                              AlertDialog(
                                title: Text('QR Code'.tr),
                                elevation: 10.0,
                                contentPadding: EdgeInsets.all(5),
                                titlePadding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                                actionsAlignment: MainAxisAlignment.center,
                                alignment: Alignment.center,
                                titleTextStyle: headingStyle,
                                backgroundColor:context.theme.backgroundColor,
                                content: Container(
                                  color: Colors.white,
                                  child: BarcodeWidget(
                                    data:userId,
                                    barcode: Barcode.qrCode(),
                                    color: Colors.black,
                                    height: 250,
                                    width: 250,
                                    backgroundColor: Colors.white,
                                    drawText: true,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                ),
                                actions: [
                                  CreateGenButtons(
                                    onTap: ()=>Get.back(),
                                    text: 'OK',
                                  )
                                ],
                              ));
                    },
                    icon: Icon(FontAwesomeIcons.qrcode,
                      color: Get.isDarkMode?Colors.pink:Colors.deepOrange,
                      size: 40,),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              RichTextUtils(mainText: 'jop'.tr + ' : ', normalText:userJop ,),
              const SizedBox(height: 10,),
              Divider(
                color: Get.isDarkMode?Colors.white:Colors.grey,
                thickness: 2,
                height: 30,
              ),

              MaterialButton(onPressed: (){},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Get.isDarkMode?pinkClr:mainColor,
                child: TextUtils(
                  color: Colors.white,
                  fontSize: 20,
                  text: 'More Details',
                  fontWeight: FontWeight.bold,
                  underLine:TextDecoration.none,
                ),),
              const SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
