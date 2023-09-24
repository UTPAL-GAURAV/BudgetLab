import 'dart:convert';

import 'package:budgetlab/Shared/service/localStorage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

height(double num, BuildContext context) {
  return MediaQuery.of(context).size.height * num;
}

width(double num, BuildContext context) {
  return MediaQuery.of(context).size.width * num;
}

Future<List<String>> getAllCategoryIcons() async {
  LocalStorageService localStorageService = LocalStorageService();
  List<String> categoryIcons = [];

  // 1. Get the paths of all images in the assets/icons/budgetCategory folder.
  final assetImages = await _getAssetImages('assets/images/icons/budgetCategory');
  categoryIcons.addAll(assetImages);

  // 2. Get the paths of all images in the local directory.
  final localDirectoryImages = await localStorageService.getLocalDirectoryImages();
  categoryIcons.addAll(localDirectoryImages);

  return categoryIcons;
}

Future<List<String>> _getAssetImages(String assetPath) async {
  List<String> assetImages = [];

  try {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    for (String key in manifestMap.keys) {
      if (key.startsWith(assetPath)) {
        assetImages.add(key);
      }
    }
  } catch (e) {
    print('Error loading asset images: $e');
  }

  return assetImages;
}