import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LocalStorageService {
  Future<String> getLocalStorageAssetsCategoryPath() async {
    final appDocDirectory = await getApplicationDocumentsDirectory();
    final appFolderPath = '${appDocDirectory.path}/BudgetLab/assets/category';

    // Check if the directory exists, and if not, create it.
    if (await Directory(appFolderPath).exists()) {
      return appFolderPath; // Folder already exists, return its path.
    } else {
      // Folder doesn't exist, create it.
      await Directory(appFolderPath).create(recursive: true);
      return appFolderPath; // Return the newly created folder's path.
    }
  }

  saveCategoryIconInLocalDirectory() {

  }

  Future<List<String>> getLocalDirectoryImages() async {
    List<String> localDirectoryImages = [];

    final assetDirectory = await getLocalStorageAssetsCategoryPath();

    try {
      final directory = Directory(assetDirectory);
      if (await directory.exists()) {
        final List<FileSystemEntity> files = directory.listSync();

        for (var file in files) {
            localDirectoryImages.add(file.path);
        }
      }
    } catch (e) {
      print('Error loading local directory images: $e');
    }

    return localDirectoryImages;
  }
}

