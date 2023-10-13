import 'dart:io';

import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Shared/routes_manager.dart';
import '../../../../Shared/service/common_service.dart';
import '../../../../Shared/widgets/widget_manager.dart';

/// Public Method //////////////////////////////////////////////////////////////

getCappedBudget() {
  return const CappedBudget();
}

/// Widget /////////////////////////////////////////////////////////////////////

class CappedBudget extends StatefulWidget {
  const CappedBudget({Key? key}) : super(key: key);

  @override
  State<CappedBudget> createState() => _CappedBudgetState();
}

class _CappedBudgetState extends State<CappedBudget> {
  CategoryController categoryController = CategoryController();

  List<Category> categoryList = [];

  @override
  void initState() {
    categoryList = categoryController.getAllCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          if (categoryList[index].isCap) {
            String currentCycleMonth = getCurrentCycleDateFormat(categoryList[index].cycle);
            String path = categoryList[index].icon;
            double budgetUsedInPercentage = categoryList[index].cycleBudget != 0
                ? ((categoryList[index].totalCycleAmount - categoryList[index].currentCycleAmountLeft) / categoryList[index].cycleBudget)
                : 0;

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/budgetOverview', arguments: categoryList[index]);
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, screenHeight(0.01, context), 0, screenHeight(0.014, context)),
                padding: EdgeInsets.fromLTRB(screenWidth(0.04, context), screenHeight(0.02, context),
                    screenWidth(0.04, context), screenHeight(0.02, context)),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: getBudgetProgressBarColor(budgetUsedInPercentage).withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(4, 8), // shadow position
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          categoryList[index].name,
                          style: TextStyle(
                              color: ColorManager.BLACK_VOID,
                              fontSize: screenHeight(0.022, context),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          categoryList[index].currentCycleAmountLeft.toString(),
                          style: TextStyle(
                              color: ColorManager.BLACK_VOID,
                              fontSize: screenHeight(0.022, context),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: screenHeight(0.006, context))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currentCycleMonth,
                          style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.018, context)),
                        ),
                        Text(
                          "left of Rs.${categoryList[index].cycleBudget}",
                          style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.018, context)),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: screenHeight(0.03, context))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Expanded takes width of parent, it's width of progress bar
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              minHeight: screenHeight(0.02, context),
                              value: budgetUsedInPercentage == 0 ? 0.008 : budgetUsedInPercentage,
                              color: getBudgetProgressBarColor(budgetUsedInPercentage),
                              backgroundColor: ColorManager.LAVENDER,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: screenHeight(0.02, context))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(// Ensure image is clipped to the container's border
                          child: path.startsWith('assets/')
                              ? Image.asset(
                            path,
                            fit: BoxFit.fill,
                            height: screenHeight(0.04, context),
                            width: screenHeight(0.04, context),// Ensure the image covers the entire container
                          )
                              : Image.file(
                            File(path),
                            fit: BoxFit.cover,
                            height: screenHeight(0.04, context),
                            width: screenHeight(0.04, context),// Ensure the image covers the entire container
                          ),
                        ),
                        getBudgetMessageForUser(budgetUsedInPercentage, context),
                        // Text(message, style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.016, context)),),
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
