
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/add_product.dart';
import 'package:graduation_project/model/product-shop.dart';
import 'package:graduation_project/model/product_models.dart';
import 'package:graduation_project/services/product_services.dart';
import 'package:uuid/uuid.dart';


class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favouritesList = [].obs;
  var proList = <ProductShopModel>[].obs;
  var isLoading = true.obs;
  var stoarge = GetStorage();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String url='';
  var uuid = const Uuid();
  File? fileImage;
  bool isAddLoading=false;
  String userName='';
  String userImageUrl='';
  bool isFav=false;
  final fb = FirebaseDatabase.instance;

  final TextEditingController productCategoryController =
  TextEditingController(text: '');
  final TextEditingController productTypeController =
  TextEditingController(text: '');
  final TextEditingController titleProductController =
  TextEditingController(text: '');
  final TextEditingController descProductController =
  TextEditingController(text: '');
  final TextEditingController priceProductController =
  TextEditingController(text: '');


  //search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    List? storedShoppings = stoarge.read<List>('isFavouritesList');

    if (storedShoppings != null) {
      favouritesList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    //getProducts();
  }

  updateImage(croppedFile){
    fileImage= File(croppedFile);
    update();
  }

  createProduct()async{
    try{
      isAddLoading=true;
      var rng = Random();
      var kId = rng.nextInt(1000);
      final User? user = _auth.currentUser;
      final _uid = user!.uid;
      await FirebaseFirestore.instance
          .collection('Users').doc(_uid)
          .get()
          .then((value) {
        userName=value.get('Name');
        userImageUrl=value.get('ImageUrl');
      });

      final ref = FirebaseStorage.instance
          .ref()
          .child('ProductImages')
          .child(titleProductController.text+userName+ '.jpg');
      await ref.putFile(fileImage!);
      url = await ref.getDownloadURL();
      final ProductId = uuid.v4();
      final refDB = fb.ref().child('product/$ProductId');
      refDB.set({
        'id':kId,
        'image':url,
        'title':titleProductController.text,
        'desc':descProductController.text,
        'category':productCategoryController.text,
        'type':productTypeController.text,
        'price':priceProductController.text,
        'rate':4.1,
      }).asStream();


    }catch(error){
      print('aa');
    }finally{
      isAddLoading=false;
      fileImage=null;
      titleProductController.clear();
      descProductController.clear();
      productCategoryController.clear();
      productTypeController.clear();
      priceProductController.clear();

    }
    update();
  }


  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);

    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await stoarge.remove("isFavouritesList");
    } else {
      final fb = FirebaseDatabase.instance;
      final ref = fb.ref().child('product/');


      favouritesList
          .add(ref.onValue.firstWhere((element) => element.snapshot.key == productId));

      await stoarge.write("isFavouritesList", favouritesList);
    }
  }

  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

  void isProductFav({
  required keyProduct,
  required kId,
  required image,
  required title,
  required desc,
  required category,
  required type,
  required price,
  required rate,
}){
    isFav=!isFav;
    final refDB = fb.ref().child('userFav/$keyProduct');

    if(isFav){
      refDB.set({
        'id':kId,
        'image':url,
        'title':title,
        'desc':desc,
        'category':category,
        'type':type,
        'price':price,
        'rate':rate,
      }).asStream();
    }else{
      refDB.remove();
    }
    update();
  }

//Search Bar Logic;

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();

      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
