
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/logic/controllers/order_controller.dart';
import 'package:graduation_project/units/constants.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/screens/more_details_order.dart';
import 'package:graduation_project/view/widgets/more/buttons.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';


class OrderScreen extends StatelessWidget {
   OrderScreen({Key? key}) : super(key: key);
  final orderData = Get.put(OrderController());
  final authController=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;
    orderData.fetchOrders();
    authController.getDateUsers();
    final orderItems = orderData.orders;
    return Scaffold(
      body: GetBuilder<OrderController>(builder: (_){
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: orderItems.length,
            itemBuilder: (BuildContext ctx, int index) {
              return (orderItems[index].userId==authController.userId)?
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                  child: Container(
                      width: double.infinity,
                      height: 330,
                      padding: const EdgeInsets.symmetric(horizontal: 10,
                          vertical: 10),
                      decoration: BoxDecoration(
                          color: Get.isDarkMode?darkGreyClr:Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(orderItems[index].userImageUrl,),
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
                                        text: orderItems[index].userName,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        underLine: TextDecoration.none,
                                      ),
                                      TextUtils(
                                        color: Get.isDarkMode?Colors.white:Colors.black,
                                        text: orderItems[index].userJop,
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
                                                  data:orderItems[index].userId,
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
                            Divider(
                              color: Get.isDarkMode?Colors.white:Colors.grey,
                              thickness: 2,
                              height: 30,
                            ),
                            RichTextUtils(mainText: 'taskType'.tr+ ' : ', normalText: orderItems[index].typeTask,),
                            const SizedBox(height: 5,),
                            RichTextUtils(mainText: 'requiredTask'.tr+ ' : ', normalText: orderItems[index].requiredTask,),
                            const SizedBox(height: 5,),
                            RichTextUtils(mainText: 'price'.tr+ ' : ', normalText: orderItems[index].price,),
                            const SizedBox(height: 5,),
                            RichTextUtils(mainText: 'createdAt'.tr+' : ', normalText: '${orderItems[index].createdAt.toDate()}',),
                            const SizedBox(height: 5,),
                            CreateGenButtons(
                              text: 'moreDetails'.tr,
                              onTap: ()=>Get.to(
                                  MoreDetailOrder(
                                    imageUrl: orderItems[index].imageUrl,
                                    imageUrl2: orderItems[index].imageUrl2,
                                    imageUrl3: orderItems[index].imageUrl3,
                                    imageUrl4: orderItems[index].imageUrl4,
                                    createdAt: orderItems[index].createdAt.toDate(),
                                    orderId:  orderItems[index].id,
                                    taskType:  orderItems[index].typeTask,
                                    requiredType:  orderItems[index].requiredTask,
                                    details:  orderItems[index].detailsOrder,
                                    price:  orderItems[index].price,
                                    taskCategory: orderItems[index].chooseCategory,
                                    worker: orderItems[index].workerName,
                                    location: orderItems[index].location,
                                    userId: orderItems[index].userId,
                                    userName: orderItems[index].userName,
                                    userImage: orderItems[index].userImageUrl,
                                    userJop: orderItems[index].userJop,
                                  )),
                            ),


                          ],
                        ),
                      ))):
              (authController.typeAccountController=='Worker' || orderItems[index].workerName==authController.userJop)?
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                  child: Container(
                      width: double.infinity,
                      height: 330,
                      padding: const EdgeInsets.symmetric(horizontal: 10,
                          vertical: 10),
                      decoration: BoxDecoration(
                          color: Get.isDarkMode?darkGreyClr:Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(orderItems[index].userImageUrl,),
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
                                        text: orderItems[index].userName,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        underLine: TextDecoration.none,
                                      ),
                                      TextUtils(
                                        color: Get.isDarkMode?Colors.white:Colors.black,
                                        text: orderItems[index].userJop,
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
                                                  data:orderItems[index].userId,
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
                            Divider(
                              color: Get.isDarkMode?Colors.white:Colors.grey,
                              thickness: 2,
                              height: 30,
                            ),
                            RichTextUtils(mainText: 'taskType'.tr+ ' : ', normalText: orderItems[index].typeTask,),
                            const SizedBox(height: 5,),
                            RichTextUtils(mainText: 'requiredTask'.tr+ ' : ', normalText: orderItems[index].requiredTask,),
                            const SizedBox(height: 5,),
                            RichTextUtils(mainText: 'price'.tr+ ' : ', normalText: orderItems[index].price,),
                            const SizedBox(height: 5,),
                            RichTextUtils(mainText: 'createdAt'.tr+' : ', normalText: '${orderItems[index].createdAt.toDate()}',),
                            const SizedBox(height: 5,),
                            CreateGenButtons(
                              text: 'moreDetails'.tr,
                              onTap: ()=>Get.to(
                                  MoreDetailOrder(
                                    imageUrl: orderItems[index].imageUrl,
                                    imageUrl2: orderItems[index].imageUrl2,
                                    imageUrl3: orderItems[index].imageUrl3,
                                    imageUrl4: orderItems[index].imageUrl4,
                                    createdAt: orderItems[index].createdAt.toDate(),
                                    orderId:  orderItems[index].id,
                                    taskType:  orderItems[index].typeTask,
                                    requiredType:  orderItems[index].requiredTask,
                                    details:  orderItems[index].detailsOrder,
                                    price:  orderItems[index].price,
                                    taskCategory: orderItems[index].chooseCategory,
                                    worker: orderItems[index].workerName,
                                    location: orderItems[index].location,
                                    userId: orderItems[index].userId,
                                    userName: orderItems[index].userName,
                                    userImage: orderItems[index].userImageUrl,
                                    userJop: orderItems[index].userJop,
                                  )),
                            ),


                          ],
                        ),
                      ))):Container();
            });
      }),
    );
  }

}

