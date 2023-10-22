import 'dart:io';

import 'package:budgetlab/Shared/enums_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/color_manager.dart';
import '../../../../Shared/routes_manager.dart';
import '../../../../Shared/service/common_service.dart';
import '../../Category/category_controller.dart';
import '../../Category/category_entity.dart';

/// Public Method //////////////////////////////////////////////////////////////

getUnCappedBudget() {
  return const UnCappedBudget();
}

/// Widget /////////////////////////////////////////////////////////////////////

class UnCappedBudget extends StatefulWidget {
  const UnCappedBudget({Key? key}) : super(key: key);

  @override
  State<UnCappedBudget> createState() => _UnCappedBudgetState();
}

class _UnCappedBudgetState extends State<UnCappedBudget> {
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
        physics: NeverScrollableScrollPhysics(),
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          if (!categoryList[index].isCap) {
            double currentCycleAmountSpent =
                categoryList[index].cycleBudget - categoryList[index].currentCycleAmountLeft;
            String path = categoryList[index].icon;
            String message = categoryList[index].transactionType == TransactionType.expense.name
                ? " spent this month"
                : categoryList[index].transactionType == TransactionType.income.name
                    ? " earned this month"
                    : " invested this month";
            String totalMessage = categoryList[index].transactionType == TransactionType.expense.name
                ? " spent in total"
                : categoryList[index].transactionType == TransactionType.income.name
                    ? " earned in total"
                    : " invested in total";

            return GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed(AppRouteConstants.budgetOverview, extra: categoryList[index]);
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, screenHeight(0.01, context), 0, screenHeight(0.016, context)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: getRandomLightColor(categoryList[index].name).withOpacity(0.3),
                      blurRadius: 5,
                      offset: Offset(4, 8), // shadow position
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(screenWidth(0.04, context), screenHeight(0.02, context),
                          screenWidth(0.04, context), screenHeight(0.02, context)),
                      decoration: BoxDecoration(
                          color: getRandomLightColor(categoryList[index].name),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
                      child: Text(
                        categoryList[index].name,
                        style: TextStyle(
                            color: ColorManager.BLACK_VOID,
                            fontSize: screenHeight(0.022, context),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(screenWidth(0.04, context), screenHeight(0.03, context),
                          screenWidth(0.04, context), screenHeight(0.03, context)),
                      child: Row(children: [
                        ClipRRect(
                          // Ensure image is clipped to the container's border
                          child: path.startsWith('assets/')
                              ? Image.asset(
                                  path,
                                  fit: BoxFit.fill,
                                  height: screenHeight(0.05, context),
                                  width: screenHeight(0.05, context), // Ensure the image covers the entire container
                                )
                              : Image.file(
                                  File(path),
                                  fit: BoxFit.cover,
                                  height: screenHeight(0.05, context),
                                  width: screenHeight(0.05, context), // Ensure the image covers the entire container
                                ),
                        ),
                        Padding(padding: EdgeInsets.only(left: screenWidth(0.05, context))),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Rs. ${currentCycleAmountSpent} ",
                                    style: TextStyle(
                                        color: ColorManager.BLACK_VOID,
                                        fontSize: screenHeight(0.024, context),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    message,
                                    style: TextStyle(
                                        color: ColorManager.DARKER_GREY,
                                        fontSize: screenHeight(0.018, context),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: screenHeight(0.01, context))),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rs. ${categoryList[index].totalAmountSpent} ${totalMessage}",
                                    style:
                                        TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.018, context)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
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
