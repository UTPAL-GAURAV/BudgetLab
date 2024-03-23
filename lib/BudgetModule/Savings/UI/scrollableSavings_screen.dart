import 'dart:io';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_controller.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../HomeModule/UI/homePage_screen.dart';
import '../../../Shared/color_manager.dart';
import '../../../Shared/constants_manager.dart';
import '../../../Shared/routes_manager.dart';
import '../../../Shared/service/common_service.dart';

/// Public Method //////////////////////////////////////////////////////////////

getScrollableSavings() {
  return ScrollableSavingsScreen();
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableSavingsScreen extends StatefulWidget {
  const ScrollableSavingsScreen({Key? key}) : super(key: key);

  @override
  State<ScrollableSavingsScreen> createState() => _ScrollableSavingsScreenState();
}

class _ScrollableSavingsScreenState extends State<ScrollableSavingsScreen> {
  SavingsController savingsController = SavingsController();

  List<Savings> savingsList = [];

  @override
  void initState() {
    savingsList = savingsController.getAllSavingsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (savingsList.isEmpty) {
      return getNoSavingsBody();
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: savingsList.length,
          itemBuilder: (context, index) {
            String path = savingsList[index].icon;
            double amountSavedInPercentage = savingsList[index].savedAmount != 0
                ? (savingsList[index].savedAmount / savingsList[index].targetAmount)
                : 0;
            double amountLeft = savingsList[index].targetAmount - savingsList[index].savedAmount;

            return GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushNamed(AppRouteConstants.savingsOverview, extra: savingsList[index]);
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, screenHeight(0.01, context), 0, screenHeight(0.02, context)),
                  padding: EdgeInsets.fromLTRB(screenWidth(0.04, context), screenHeight(0.02, context),
                      screenWidth(0.04, context), screenHeight(0.03, context)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.PROGRESS_BLUE.withOpacity(0.4),
                        blurRadius: 5,
                        offset: const Offset(4, 8), // shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                          child: getImageToDisplay(path, 'assets/images/stickers/savings.png', 0.5, 0.9, context)),
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
                                value: amountSavedInPercentage == 0 ? 0.008 : amountSavedInPercentage,
                                color: getBudgetProgressBarColor(amountSavedInPercentage),
                                backgroundColor: ColorManager.LAVENDER,
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: screenHeight(0.006, context))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Rs. ${amountLeft.toString()}",
                            style: TextStyle(
                                color: ColorManager.BLACK_VOID,
                                fontSize: screenHeight(0.022, context),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            savingsList[index].title,
                            style: TextStyle(
                                color: ColorManager.BLACK_VOID,
                                fontSize: screenHeight(0.028, context),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "more to save",
                            style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.018, context)),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: screenHeight(0.03, context))),
                      Text(
                        getSavingsEstimatedDateMessageForUser(savingsList[index]),
                        style: TextStyle(color: ColorManager.BLACK_VOID, fontSize: screenHeight(0.018, context)),
                      ),
                      Padding(padding: EdgeInsets.only(top: screenHeight(0.016, context))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          getSavingsMessageForUser(savingsList[index]),
                        ],
                      ),
                    ],
                  ),
                ));
          });
    }
  }

  getNoSavingsBody() {
    return Container(
        width: screenWidth(0.9, context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5), // Adjust opacity as needed
                BlendMode.srcATop,
              ),
              child: getImageToDisplay(
                  'assets/images/stickers/noSavings.png', 'assets/images/stickers/noSavings.png', 0.5, 0.5, context),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                ConstantsManager.NO_SAVINGS,
                textAlign: TextAlign.center,
                style: TextStyle(color: ColorManager.FLUTTER_BLUE, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
