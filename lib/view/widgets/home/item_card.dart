

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/screens/product_details_scree.dart';

import '../text_utils.dart';

class ItemCard extends StatelessWidget {
   ItemCard({
    Key? key,
  }) : super(key: key);
  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('product/');
    List lists = [];
    return  Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder(
          stream: ref.onValue,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              lists.clear();
              DataSnapshot dataValues = snapshot.data.snapshot;
              Map<dynamic, dynamic> values = dataValues.value as Map;
              values.forEach((key, values) {
                lists.add(values);
              });
              return new GridView.builder(
                  itemCount: lists.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) =>
                  BuildItem(
                    title: lists[index]['title'],
                    price: lists[index]['price'],
                    image: lists[index]['image'],
                    desc: lists[index]['desc'],
                    id: lists[index]['id'],
                  )
              );
            }
            return Container(child: Text("Add Plants"));
          },
        )
        ,
      ),
    );
  }
}



class BuildItem extends StatelessWidget {
  final String price;
  final String title;
  final String image;
  final String desc;
  final int id;
  const BuildItem({
    Key? key,

    required this.price,required this.title,
    required  this.id,required this.image,required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Get.to(ProductDetailsScreen(
        id: id,
        image: image,
        price: price,
        title: title,
        desc: desc,
      )),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Get.isDarkMode?darkGreyClr:Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: "${id}",
                child: Image.network(image,
                width: double.infinity,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextUtils(
    color: Get.isDarkMode?Colors.white:Colors.black,
    text: title,
    fontWeight: FontWeight.normal,
    fontSize: 18,
    mixLine: 2,
    underLine: TextDecoration.none,
    )
            ),
           TextUtils(fontSize: 15,
               fontWeight: FontWeight.normal,
               text: '${price}',
               color: Get.isDarkMode?Colors.white:Colors.black,
               underLine: TextDecoration.none)
          ],
        ),
      ),
    );
  }
}
