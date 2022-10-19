

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/model/order_model.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';

class OrderController extends GetxController {

  var orders = <OrderModel>[];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String url0='';
  String? url1;
  String? url2;
  String? url3;
  var uuid = const Uuid();
  bool isCategoryWorker=false;
  bool  isPrice=false;
  Location location = Location();
  var latitude = 0.0;
  var longitude = 0.0;
  LocationData? locationData;
  File? fileImage0;
  File? fileImage1;
  File? fileImage2;
  File? fileImage3;
  String userName='';
  String userImageUrl='';
  String userJop='';
  bool isLoading=false;
  final TextEditingController taskTypeController =
  TextEditingController(text: '');
  final TextEditingController taskCategoryController =
  TextEditingController(text: '');
  final TextEditingController workerNameController =
  TextEditingController(text: '');
  final TextEditingController priceController =
  TextEditingController(text: '');
  final TextEditingController locationController =
  TextEditingController(text: '');
  final TextEditingController requiredTaskController =
  TextEditingController(text: '');
  final TextEditingController detailsTaskController =
  TextEditingController(text: '');
  final TextEditingController wayToCommunicateController =
  TextEditingController(text: '');


  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  updateImage0(croppedFile){
    fileImage0= File(croppedFile);
    update();
  }
  updateImage1(croppedFile){
    fileImage1= File(croppedFile);
    update();
  }
  updateImage2(croppedFile){
    fileImage2= File(croppedFile);
    update();
  }
  updateImage3(croppedFile){
    fileImage3= File(croppedFile);
    update();
  }
  orderTaskType(String taskType){
    taskTypeController.text=taskType;
    Get.back();
    update();
  }
  orderChooseCategory(String taskCategory){
    taskCategoryController.text=taskCategory;
    if(taskCategory=='عامل'){
      isCategoryWorker=true;
    }else{
      isCategoryWorker=false;
    }
    Get.back();
    update();
  }
  orderIsWorker(String workerName){
    if(isCategoryWorker){
      workerNameController.text=workerName;
    }else{
      workerNameController.text='شركه';
    }
    Get.back();
    update();
  }
  orderPrice(){
    isPrice=!isPrice;
    update();
  }
  void dynamicLocation()async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled =
    await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled =
      await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted =
    await location.hasPermission();
    if (_permissionGranted ==
        PermissionStatus.denied) {
      _permissionGranted =
      await location.requestPermission();
      if (_permissionGranted !=
          PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location
        .getLocation()
        .then((value) {
      latitude = value.latitude!;
      longitude = value.longitude!;
      locationController.text='https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    });
    update();
  }
  void dynamicPhoneNumber(String phoneNumber){
    wayToCommunicateController.text=phoneNumber;
    update();
  }


  createOrder()async{
   try{
     isLoading=true;
     final User? user = _auth.currentUser;
     final _uid = user!.uid;
     await FirebaseFirestore.instance
         .collection('Users').doc(_uid)
         .get()
         .then((value) {
       userName=value.get('Name');
       userJop=value.get('Jop');
       userImageUrl=value.get('ImageUrl');
     });
     final ref = FirebaseStorage.instance;
     final ref0 = ref
         .ref()
         .child('ordersImages')
         .child(requiredTaskController.text+ '0'+'.jpg');
     await ref0.putFile(fileImage0!);
     url0 = await ref0.getDownloadURL();
    if(fileImage1 !=null){
      final ref1 = ref
          .ref()
          .child('ordersImages')
          .child(requiredTaskController.text+ '1'+'.jpg');
      await ref1.putFile(fileImage1!);
      url1 = await ref1.getDownloadURL();
    }
     if(fileImage2 !=null){
       final ref2 = ref
           .ref()
           .child('ordersImages')
           .child(requiredTaskController.text+ '2'+'.jpg');
       await ref2.putFile(fileImage2!);
       url2 = await ref2.getDownloadURL();
     }
     if(fileImage3 !=null){
       final ref3 = ref
           .ref()
           .child('ordersImages')
           .child(requiredTaskController.text+ '3'+'.jpg');
       await ref3.putFile(fileImage3!);
       url3 = await ref3.getDownloadURL();
     }

     final orderId = uuid.v4();
     await FirebaseFirestore.instance
         .collection('Orders')
         .doc(orderId)
         .set({
       'id':orderId,
       'typeTask':taskTypeController.text,
       'requiredTask':requiredTaskController.text,
       'chooseCategory':taskCategoryController.text,
       'workerName':workerNameController.text,
       'price':priceController.text,
       'details':detailsTaskController.text,
       'location':locationController.text,
       'wayToCommunicate':wayToCommunicateController.text,
       'imageUrl':url0,
       'userId': _uid,
       'userName':userName,
       'useImageUrl':userImageUrl,
       'userJop':userJop,
       'createdAt': Timestamp.now(),
       'imageUrl2':url1??'',
       'imageUrl3':url2??'',
       'imageUrl4':url3??'',
     });
   }catch(error){
     print(error);
   }finally{
     isLoading=false;
     isPrice=false;
     fileImage0=null;
     fileImage1=null;
     fileImage2=null;
     fileImage3=null;
      taskTypeController.clear();
      taskCategoryController.clear();
     workerNameController.clear();
     priceController.clear();
     locationController.clear();
     requiredTaskController.clear();
     detailsTaskController.clear();
     wayToCommunicateController.clear();

   }
    update();
  }




  Future<void> fetchOrders() async {
    await FirebaseFirestore.instance
        .collection('Orders')
        .get()
        .then((QuerySnapshot ordersSnapshot) {
      orders = [];
      for (var element in ordersSnapshot.docs) {
          orders.insert(
              0,
              OrderModel(
                id: element.get('id'),
                typeTask: element.get('typeTask'),
                requiredTask: element.get('requiredTask'),
                chooseCategory: element.get('chooseCategory'),
                workerName: element.get('workerName'),
                price: element.get('price'),
                detailsOrder:  element.get('details'),
                location: element.get('location'),
                wayToCommunicate: element.get('wayToCommunicate'),
                imageUrl: element.get('imageUrl'),
                imageUrl2: element.get('imageUrl2'),
                imageUrl3: element.get('imageUrl3'),
                imageUrl4: element.get('imageUrl4'),

                userId: element.get('userId'),
                  userName: element.get('userName'),
              userJop: element.get('userJop'),
              userImageUrl: element.get('useImageUrl'),

                createdAt: element.get('createdAt'),
              )
          );
      }
    });
    update();
  }



  OrderModel findById(String productId) {
    return orders.firstWhere((element) => element.id == productId);
  }

  List<OrderModel>? findByWorkerName(String categoryName) {
    List<OrderModel> _categoryList = orders
        .where((element) => element.workerName
        .toString().toLowerCase()
        .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List<OrderModel> findByTypeTask(String brandName) {
    List<OrderModel> _categoryList = orders
        .where((element) =>
        element.typeTask.toString().toLowerCase().contains(brandName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  /*List<OrderModel> searchQuery(String searchText) {
    List<OrderModel> _searchList = orders
        .where((element) =>
        element.title.toString().toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    return _searchList;
  }*/
}
