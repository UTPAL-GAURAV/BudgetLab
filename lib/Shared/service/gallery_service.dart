
import 'dart:io';

import 'package:budgetlab/Shared/service/localStorage_service.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class GalleryService {
LocalStorageService localStorageService = LocalStorageService();

  Future<XFile> getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    //     .then((value){
    //   // if(value != null) {
    //   //   return _cropImage(File(value.path));
    //   // }
    // });



    if (pickedImage != null) {
      final assetDirectory = await localStorageService.getLocalStorageAssetsCategoryPath();
      final File pickedFile = File(pickedImage.path);
      String randomUUIDName = Uuid().v4() + pickedImage.name;
      // Saves user selected image in local storage of BudgetLab
      final savedImagePath = await pickedFile.copy('$assetDirectory/$randomUUIDName');

      return XFile(savedImagePath.path);
      // return pickedImage;
    } else {
      return XFile('assets/images/icons/budgetCategory/piggy.png');
    }
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ] : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [AndroidUiSettings(
            toolbarTitle: "Image Cropper",
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {

      imageCache.clear();
      return File(croppedFile.path);
      // reload();
    }
  }
}