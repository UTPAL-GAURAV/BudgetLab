import 'dart:convert';
import 'dart:math';

import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/service/localStorage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../enums_manager.dart';

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

Color getBudgetProgressBarColor(double budgetUsedInPercentage) {
  if (budgetUsedInPercentage >= 1) {
    return ColorManager.HOT_CORAL;
  } else if (budgetUsedInPercentage >= 0.8) {
    return ColorManager.MUSTARD;
  }
  return ColorManager.PROGRESS_BLUE;
}

String getFairShareGroupIcon(FairShareGroupCategory category) {
  if(category == FairShareGroupCategory.travel) {
    Random random = Random();
    int number = random.nextInt(3);
    switch(number) {
      case 0: return "assets/images/icons/trip1.png";
      case 1: return "assets/images/icons/trip2.png";
      case 2: return "assets/images/icons/trip3.png";
    }
  } else if(category == FairShareGroupCategory.dineOut) {
    return "assets/images/icons/food2.png";
  } else if(category == FairShareGroupCategory.home) {
    return "assets/images/icons/house2.png";
  } else if(category == FairShareGroupCategory.couple) {
    return "assets/images/icons/couple.png";
  }
  return "assets/images/icons/expenseList.png";
}

Color getRandomLightColor(String input) {
  const int colorCountInList = 6;
  int i = input.hashCode % colorCountInList;
  // Avoid Red & Green colors, as it gives wrong impression
  List<Color> colorList = [
    ColorManager.LIGHT_CYAN,
    ColorManager.LIGHTER_PURPLE,
    ColorManager.LIGHT_BLUE,
    ColorManager.LIGHT_MAGENTA,
    ColorManager.LIGHT_YELLOW,
    ColorManager.LIGHT_ORANGE,
  ];
  return colorList[i];
}

Color getRandomDarkColor(String input) {
  const int colorCountInList = 6;
  int i = input.hashCode % colorCountInList;
  // Avoid Red & Green colors, as it gives wrong impression
  List<Color> colorList = [
    ColorManager.CYAN,
    ColorManager.DARKER_GREEN,
    ColorManager.BLUE,
    ColorManager.HOT_CORAL,
    ColorManager.GOLDEN,
    ColorManager.DARK_ORANGE,
  ];
  return colorList[i];
}

String getCurrentCycleDateFormat(String cycle) {
  if (cycle == BudgetCycle.Weekly.name) {
    final now = DateTime.now();
    // Format the dates as required
    final formatter = DateFormat('dd MMM');
    // Calculate date of the previous Monday
    final formattedPreviousMonday = formatter.format(now.subtract(Duration(days: now.weekday - 1)));
    // Calculate date of the upcoming Sunday
    final formattedUpcomingSunday = formatter.format(now.add(Duration(days: 7 - now.weekday)));
    return "${formattedPreviousMonday} - ${formattedUpcomingSunday}";
  } else if (cycle == BudgetCycle.Monthly.name) {
    return DateFormat('MMM, yyyy').format(DateTime.now());
  }
  return "Year ${DateTime.now().year}";
}

bool checkIfCurrentDateIsWithinCurrentCycle(String cycle, DateTime currentDateTime) {
  final now = DateTime.now();
  if (cycle == BudgetCycle.Weekly.name) {
    // Calculate date of the previous Monday
    final previousMonday = now.subtract(Duration(days: now.weekday - 1));
    // Calculate date of the upcoming Sunday
    final upcomingSunday = now.add(Duration(days: 7 - now.weekday));
    if (currentDateTime.isAfter(previousMonday) && currentDateTime.isBefore(upcomingSunday)) {
      return true;
    }
  } else if (cycle == BudgetCycle.Monthly.name) {
    if (currentDateTime.month == DateTime.now().month) {
      return true;
    }
  } else if (cycle == BudgetCycle.Yearly.name) {
    if (currentDateTime.year == DateTime.now().year) {
      return true;
    }
  }
  return false;
}
