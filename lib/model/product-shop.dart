import 'package:firebase_database/firebase_database.dart';

class ProductShopModel{
  final int id;
  final String title;
  final String desc;
  final String image;
  final String category;
  final String type;
  final String price;

  ProductShopModel(
      {
        required this.id,
        required this.title,
        required this.desc,
        required this.image,
        required this.category,
        required this.type,
        required this.price,
      }
      );

 /* factory  ProductShopModel.fromSnapshot(DataSnapshot snapshot) {
   return ProductShopModel(
       id: snapshot.key as int,
       title: snapshot.value!['title']
       desc: desc,
       image: image,
       category: category,
       type: type,
       price: price)
  }

  toJson() {
    return {'name': name, 'description': description, 'questions': questions};
  }*/
}