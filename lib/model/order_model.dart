import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderModel with ChangeNotifier{
   String id;
   String typeTask;
   String requiredTask;
   String detailsOrder;
   String price;
   String imageUrl;
   String imageUrl2;
   String imageUrl3;
   String imageUrl4;
   String chooseCategory;
   String workerName;
   String wayToCommunicate;
   String location;
   String userId;
   String userName;
   String userImageUrl;
   String userJop;
   Timestamp createdAt;
   OrderModel({required this.id,
      required this.typeTask,
      required this.requiredTask,
      required this.detailsOrder,
      required this.price,
      required this.imageUrl,
      required this.imageUrl2,
      required this.imageUrl3,
      required this.imageUrl4,
      required this.chooseCategory,
      required this.workerName,
      required this.wayToCommunicate,
      required this.location,
      required this.userId,
      required this.createdAt,
      required this.userName,
      required this.userImageUrl,
      required this.userJop,
   });


}
