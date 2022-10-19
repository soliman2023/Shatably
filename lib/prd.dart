
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';


class Home extends StatelessWidget {

  final fb = FirebaseDatabase.instance;



  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('product/');

    List lists = [];
    var color = context.theme.backgroundColor;
    return Scaffold(
      backgroundColor: Get.isDarkMode ? backDark : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: TextUtils(
          color: Colors.white,
          underLine: TextDecoration.none,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          text: 'Edit Product'.tr,
        ),
        elevation: 0.0,
        foregroundColor: Colors.white,
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
      ),

      body: Container(
        child: StreamBuilder(
          stream: ref.onValue,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print("Error on the way");
              lists.clear();
              DataSnapshot dataValues = snapshot.data.snapshot;
              Map<dynamic, dynamic> values = dataValues.value as Map;
              values.forEach((key, values) {
                lists.add(values);
              });
              return new ListView.builder(
                shrinkWrap: true,
                itemCount: lists.length,
                itemBuilder: ( context,  index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Name:  ${lists[index]["price"]}"),
                        Text("Image: " + lists[index]["image"]),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(lists[index]["image"]),
                        )
                      ],
                    ),
                  );
                },
              );
            }
            return Container(child: Text("Add Plants"));
          },
        ),
      ),

    );
  }













/*
* FirebaseAnimatedList(
        query: ref,
        shrinkWrap: true,
        itemBuilder: (context, snapshot, animation, index) {
          var v = snapshot.value.toString();
          g = v.replaceAll(
              RegExp(
                  "{|}|desc: |title: |price: |category: |id: |type: |image: "),
              "");
          g.trim();
          list = g.split(',');


          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Get.isDarkMode ? darkGreyClr:Colors.grey.shade400 ,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('http://${list[4]}' ),
                      ),
                      TextUtils(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          text: list[0],
                          color: Colors.black,
                          underLine: TextDecoration.none)
                    ],
                  )
                ],
              ),
            ),
          );
        },
      )*/
/*
  upd() async {
    DatabaseReference ref1 = FirebaseDatabase.instance.ref("todos/$k");

    await ref1.update({
      "title": 'second.text',
      "subtitle": 'third.text',
    });
  }
}*/
}
