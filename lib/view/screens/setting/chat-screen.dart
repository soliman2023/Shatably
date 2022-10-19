
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/chat_model.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/setting/bubble_chat.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';


class ChatScreen extends StatelessWidget {

  ChatScreen({Key? key,}) : super(key: key);
  ScrollController scrollController=ScrollController();
  TextEditingController controller=TextEditingController();
  CollectionReference message = FirebaseFirestore.instance.collection('messages');
  FirebaseAuth auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy('created',descending: true).snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<ChatModel> messageList=[];
            for(int i=0;i<snapshot.data!.docs.length;i++){
              messageList.add(ChatModel.jsonDate(snapshot.data!.docs[i]));
            }
            return Scaffold(
              backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Get.isDarkMode?pinkClr:mainColor,
                  title: TextUtils(
                    fontSize: 20,
                    color: Colors.white,
                    text: 'generalChat'.tr,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          controller: scrollController,
                          reverse: true,
                          itemCount: messageList.length,
                          itemBuilder: (context,index){
                            return  messageList[index].id==auth.currentUser!.uid?
                            BubbleChat(message: messageList[index],):
                            BubbleChatFormFriend(message: messageList[index],);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller:controller ,
                        decoration:  InputDecoration(
                          hintText: 'message'.tr,
                          filled: true,
                          fillColor: Get.isDarkMode?Colors.grey.shade900:Colors.grey.shade300,
                          suffixIcon: InkWell(
                            onTap: (){
                              message.add({
                                'message': controller.text,
                                'created':DateTime.now(),
                                'id':auth.currentUser!.uid,
                              });
                              scrollController.animateTo(
                                0,
                                duration:const Duration(milliseconds: 400),
                                curve: Curves.ease,
                              );
                              controller.clear();
                            },
                            child: Icon(Icons.send,
                              color: Get.isDarkMode?pinkClr:mainColor,
                            ),
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Get.isDarkMode?pinkClr:mainColor,
                                  width: 2
                              )
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Get.isDarkMode?pinkClr:mainColor,
                                  width: 1
                              )
                          ),
                        ),
                        onSubmitted: (date){
                          message.add({
                            'message': date,
                            'created':DateTime.now(),
                            'id':auth.currentUser!.uid,
                          });
                          scrollController.animateTo(
                            0,
                            duration:const Duration(milliseconds: 400),
                            curve: Curves.ease,
                          );
                          controller.clear();
                        },
                      ),
                    ),
                  ],
                )
            );
          }else{
            return const Text('Loading...');
          }
        });
  }


}