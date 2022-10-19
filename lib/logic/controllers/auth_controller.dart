
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/services/global_method.dart';
import 'package:location/location.dart';


class AuthController extends GetxController {
  bool isVisible = true;
  bool isVisibleConfirm = true;

  final TextEditingController typeAccountController =
  TextEditingController(text: '');
  final TextEditingController jopController =
  TextEditingController(text: '');
  final TextEditingController locationController =
  TextEditingController(text: '');
  final TextEditingController birthDayController =
  TextEditingController(text: '');


  bool isWorker=false;
  bool isClient=false;
  bool isCompany=false;
  bool isShop=false;

  Location location = Location();
  var latitude = 0.0;
  var longitude = 0.0;
  LocationData? locationData;
  int age=0;

  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  //FaceBookModel? faceBookModel;
  String urlImage='';
  File? fileImage;


  var isSignedIn = false;
  final GetStorage authBox = GetStorage();

  User? get userProfile => auth.currentUser;

  String userName='';
  String userImageUrl='';
  String userEmail='';
  String userPhoneNumber='';
  String userJop='';
  String userId='';
  int userAge=0;
  String userLocation='';
  String userTypeAccount='';
  Timestamp userJoin=Timestamp.now();


  updateImage(croppedFile){
    fileImage= File(croppedFile);
    update();
  }

  chooseTypeAccount(String item){
    typeAccountController.text=item;
    if(typeAccountController.text=='Worker')
    {
      isWorker=true;
      isClient=false;
      isShop=false;
      isCompany=false;
    }
    else if(typeAccountController.text=='Shop'){
      isWorker=false;
      isClient=false;
      isShop=true;
      isCompany=false;

    }else
    {
      isWorker = false;
      isClient = true;
      isShop = false;
      isCompany = true;
    }
    Get.back();
     update();
  }

  chooseWorker(String listWorker,){
    jopController.text=listWorker;
    Get.back();
    update();
  }

  void visibility() {
    isVisible = !isVisible;
    update();
  }
  void visibilityConfirm() {
    isVisibleConfirm = !isVisibleConfirm;
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

  void sumOfAge(BuildContext context){
    showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year-20),
      firstDate:DateTime(1960),
      lastDate: DateTime(DateTime.now().year-20),
    ).then((value) {
      if (value != null) {
        birthDayController.text = '${value.year} / ${value.month} / ${value.day}';
        age=DateTime.now().year-value.year;
      }
    });
  }



  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
     required File? file,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        auth.currentUser!.updateDisplayName(name);
        auth.currentUser!.updateEmail(email);

      });
      String? uId=userProfile!.uid;
       var ref=  FirebaseStorage.instance.ref().child('UsersImage')
      .child(uId+'.png');
        await ref.putFile(file!);
        urlImage=await ref.getDownloadURL();
      FirebaseFirestore.instance.collection('Users')
      .doc(uId).set({
        'Id':uId,
        'Name':name,
        'Email':email,
        'ImageUrl':urlImage,
        'Phone Number':phoneNumber,
        'Age':age,
        'TypeAccount':typeAccountController.text,
        'Jop':jopController.text,
        'location':locationController.text,
        'CreateAt':Timestamp.now(),
      });

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }
      GlobalHandlingError.showSnackBarError(title: title, message: message);
    } catch (error) {
      GlobalHandlingError.showSnackBarError(title: 'Error', message: error.toString());
    }
  }

  void getDateUsers()async{
    String? uId=userProfile!.uid;
    await FirebaseFirestore.instance
        .collection('Users').doc(uId)
        .get()
        .then((value) {
      userName=value.get('Name');
      userJop=value.get('Jop');
       userEmail=value.get('Email');;
       userPhoneNumber=value.get('Phone Number');;
      userImageUrl=value.get('ImageUrl');
      userJoin=value.get('CreateAt');
       userId=uId;
       userAge=value.get('Age');
       userLocation=value.get('location');
       userTypeAccount=value.get('TypeAccount');
    });
    update();
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              userName = auth.currentUser!.displayName!
      );

      isSignedIn = true;
      authBox.write("auth", isSignedIn);

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
      } else {
        message = error.message.toString();
      }
      GlobalHandlingError.showSnackBarError(title: title, message: message);
    } catch (error) {
      GlobalHandlingError.showSnackBarError(title: 'Error', message: error.toString());
    }
  }

  /*void googleSinUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();

      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Get.isDarkMode?Colors.grey:Colors.white,
          colorText: Colors.black,
          isDismissible: true,
          icon: const Icon(Icons.warning_amber_outlined,color: Colors.red,)
      );
    }
  }*/


/*
  void faceBookSignUpApp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    // final accesToken = loginResult.accessToken!.token;
    // final credential = FacebookAuthProvider.credential(accesToken);
    // await auth.signInWithCredential(credential);

    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);
      // displayUserPhoto.value = faceBookModel!.faceBookPhotoModel!.url!;
      // displayUserEmail.value = faceBookModel!.email!;
      // displayUserName.value = faceBookModel!.name!;
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    }
  }*/

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else {
        message = error.message.toString();
      }
      GlobalHandlingError.showSnackBarError(title: title, message: message);
    } catch (error) {
      GlobalHandlingError.showSnackBarError(title: 'Error', message: error.toString());
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      //await FacebookAuth.i.logOut();
       userName='';
       userImageUrl='';
       userEmail='';
       userPhoneNumber='';
       userJop='';
       userId='';
       userAge=0;
       userLocation='';
       userTypeAccount='';
      isSignedIn = false;
      authBox.remove("auth");
      update();
      Get.back();
      Get.offNamed(RouteApp.stateUser);
    } catch (error) {
      GlobalHandlingError.showSnackBarError(title: 'Error', message: error.toString());
    }
  }
}
