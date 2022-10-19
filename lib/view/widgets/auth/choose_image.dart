


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/units/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImage extends StatelessWidget {
  final controller;
   const ChooseImage({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
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
            child: controller.fileImage == null ?
            Image.network(
              urlImageSignUp,
              fit: BoxFit.fill,
            )
                : Image.file(controller.fileImage!, fit: BoxFit.fill,
            )
            ,
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title:  Text(
                      'Please choose an option',
                      style: TextStyle(
                          fontSize: 20,
                          color: Get.isDarkMode?Colors.white:Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            XFile? _picked =
                            await ImagePicker().pickImage(source: ImageSource.camera,
                                maxHeight: 1080,
                                maxWidth: 1080);
                            if (_picked != null) {
                              File? croppedFile=
                              (await ImageCropper()
                                  .cropImage(
                                  sourcePath: _picked.path,
                                  maxWidth: 1080,
                                  maxHeight: 1080)) ;
                              controller.updateImage(croppedFile!.path);
                            }
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.photo,
                                  color: Colors.purple,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Camera',
                                  style: TextStyle(
                                      color:
                                      Colors.purple,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            XFile? _picked =
                            await ImagePicker().pickImage(source:
                            ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
                            if (_picked != null) {
                              File? croppedFile =
                              await ImageCropper().cropImage(
                                  sourcePath:
                                  _picked.path,
                                  maxWidth: 1080,
                                  maxHeight:
                                  1080);
                              controller.updateImage(croppedFile!);

                            }
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.camera,
                                  color: Colors.purple,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Gallery',
                                  style: TextStyle(
                                      color:
                                      Colors.purple,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 2, color: Colors.white),
                color: Colors.pink),
            child: Icon(
              controller.fileImage == null
                  ? Icons.camera_alt
                  : Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}


class ChooseOrderImage extends StatelessWidget {
  final int index;
  final controller;
  const ChooseOrderImage({Key? key,
   required  this.index,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
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
            child: index==0?controller.fileImage0 == null ?
            Image.network(
              urlImageOrders,
              fit: BoxFit.fill,
            )
                : Image.file(controller.fileImage0!, fit: BoxFit.fill,
            ):index==1?
            controller.fileImage1 == null ?
            Image.network(
              urlImageOrders,
              fit: BoxFit.fill,
            )
                : Image.file(controller.fileImage1!, fit: BoxFit.fill,
            ):index==2?controller.fileImage2 == null ?
            Image.network(
              urlImageOrders,
              fit: BoxFit.fill,
            )
                : Image.file(controller.fileImage2!, fit: BoxFit.fill,
            ):controller.fileImage3 == null ?
            Image.network(
              urlImageOrders,
              fit: BoxFit.fill,
            )
                : Image.file(controller.fileImage3!, fit: BoxFit.fill,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title:  Text(
                      'dialogTitle'.tr,
                      style: TextStyle(
                          fontSize: 20,
                          color:Get.isDarkMode?Colors.white:Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            XFile? _picked =
                            await ImagePicker().pickImage(source: ImageSource.camera,
                                maxHeight: 1080,
                                maxWidth: 1080);
                            if (_picked != null) {
                              File? croppedFile=
                              (await ImageCropper()
                                  .cropImage(
                                  sourcePath: _picked.path,
                                  maxWidth: 1080,
                                  maxHeight: 1080)) ;
                              index==0? controller.updateImage0(croppedFile!.path):
                              index==1? controller.updateImage1(croppedFile!.path):
                              index==2? controller.updateImage2(croppedFile!.path):
                              controller.updateImage3(croppedFile!.path);
                            }
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Row(
                              children:  [
                                Icon(
                                  Icons.camera,
                                  color: Get.isDarkMode?Colors.white:Colors.purple,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'camera'.tr,
                                  style: TextStyle(
                                      color: Get.isDarkMode?Colors.white:Colors.purple,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                            XFile? _picked =
                            await ImagePicker().pickImage(source:
                            ImageSource.gallery, maxHeight: 1080, maxWidth: 1080);
                            if (_picked != null) {
                              File? croppedFile =
                              await ImageCropper().cropImage(
                                  sourcePath:
                                  _picked.path,
                                  maxWidth: 1080,
                                  maxHeight:
                                  1080);
                              index==0? controller.updateImage0(croppedFile!.path):
                              index==1? controller.updateImage1(croppedFile!.path):
                              index==2? controller.updateImage2(croppedFile!.path):
                              controller.updateImage0(croppedFile!.path);

                            }
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.all(8.0),
                            child: Row(
                              children:  [
                                Icon(
                                  Icons.photo,
                                  color: Get.isDarkMode?Colors.white:Colors.purple,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'gallery'.tr,
                                  style: TextStyle(
                                      color: Get.isDarkMode?Colors.white:Colors.purple,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 2, color: Colors.white),
                color: Colors.pink),
            child: index==0?Icon(
              controller.fileImage0 == null
                  ? Icons.camera_alt
                  : Icons.edit,
              color: Colors.white,
              size: 20,
            ):
            index==1?
            Icon(
              controller.fileImage1 == null
                  ? Icons.camera_alt
                  : Icons.edit,
              color: Colors.white,
              size: 20,
            ):
            index==2?Icon(
              controller.fileImage2 == null
                  ? Icons.camera_alt
                  : Icons.edit,
              color: Colors.white,
              size: 20,
            ):
            Icon(
              controller.fileImage3 == null
                  ? Icons.camera_alt
                  : Icons.edit,
              color: Colors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}


