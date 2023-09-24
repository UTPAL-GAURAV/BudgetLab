import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/enums_manager.dart';
import 'package:budgetlab/Shared/service/gallery_service.dart';
import 'package:budgetlab/Shared/service/providers/category_provider.dart';
import 'package:budgetlab/Shared/service/providers/incomeExpense_provider.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../../../Shared/routes_manager.dart';
import '../../../../Shared/service/common_service.dart';

/// Public Method //////////////////////////////////////////////////////////////

getScrollableCategoryIcons(onCategorySelectedCallback) {
  return ScrollableCategoryIcons(onCategorySelected: onCategorySelectedCallback);
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableCategoryIcons extends StatefulWidget {
  final Function(String) onCategorySelected;
  ScrollableCategoryIcons({Key? key, required this.onCategorySelected}) : super(key: key);

  @override
  State<ScrollableCategoryIcons> createState() => _ScrollableCategoryIconsState();
}

class _ScrollableCategoryIconsState extends State<ScrollableCategoryIcons> {
  int allCategoryListLength = 0;
  late ValueNotifier<List<String>> allIconsList;

  CategoryController categoryController = CategoryController();
  GalleryService galleryService = GalleryService();

  @override
  void initState() {
    super.initState();
    allIconsList = ValueNotifier<List<String>>([]);
    fetchData();
  }

  void fetchData() async {
    List<String> fetchedData = await getAllCategoryIcons();
    allIconsList.value = fetchedData;
    allCategoryListLength = fetchedData.length;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(builder: (context, provider, child) {
      return ValueListenableBuilder<List<String>>(
        valueListenable: allIconsList,
        builder: (context, iconsList, _) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                    iconsList.length,
                    (index) {
                      final iconPath = iconsList[index];
                      bool isSelected = provider.selectedIcon == index;
                      return GestureDetector(
                        onTap: () => {provider.setSelectedIcon(index), widget.onCategorySelected(iconPath)},
                        child: Container(
                          // Adjust the padding between buttons
                          margin: const EdgeInsets.all(6),
                          child: getIconButtons(iconPath, context, isSelected),
                        ),
                      );
                    },
                  ) +
                  [
                    GestureDetector(
                      onTap: () async {
                        Map<Permission, PermissionStatus> statuses = await [
                          Permission.storage,
                        ].request();
                        if (statuses[Permission.storage]!.isGranted) {}
                        final xFile = await galleryService.getImageFromGallery(); // Open gallery when CircleAvatar is tapped
                        provider.setUploadedImage(xFile.path);
                        allIconsList.value.add(xFile.path);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        child: getLastIconEditButton(context),
                      ),
                    ),
                  ],
            ),
          );
        },
      );
    });
  }
}
