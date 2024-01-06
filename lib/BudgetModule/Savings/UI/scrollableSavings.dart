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
import '../../../Shared/routes_manager.dart';

/// Public Method //////////////////////////////////////////////////////////////

getScrollableSavings() {
  return ScrollableSavings();
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableSavings extends StatefulWidget {
  const ScrollableSavings({Key? key}) : super(key: key);

  @override
  State<ScrollableSavings> createState() => _ScrollableSavingsState();
}

class _ScrollableSavingsState extends State<ScrollableSavings> {
  SavingsController savingsController = SavingsController();

  List<Savings> savingsList = [];

  @override
  void initState() {
    savingsList = savingsController.getAllSavingsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: savingsList.length,
        itemBuilder: (context, index) {
          String path = savingsList[index].icon;
          double amountSavedInPercentage = savingsList[index].savedAmount != 0
              ? (savingsList[index].savedAmount / savingsList[index].targetAmount)
              : 0;

          return GestureDetector(
              onTap: () {
                GoRouter.of(context).pushNamed(AppRouteConstants.savingsOverview, extra: savingsList[index]);
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, screenHeight(0.01, context), 0, screenHeight(0.014, context)),
                padding: EdgeInsets.fromLTRB(screenWidth(0.04, context), screenHeight(0.02, context),
                    screenWidth(0.04, context), screenHeight(0.02, context)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.PROGRESS_BLUE,
                      blurRadius: 5,
                      offset: const Offset(4, 8), // shadow position
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          // Ensure image is clipped to the container's border
                          child: path.startsWith('assets/')
                              ? Image.asset(
                                  path,
                                  fit: BoxFit.fill,
                                  height: screenHeight(0.04, context),
                                  width: screenHeight(0.04, context), // Ensure the image covers the entire container
                                )
                              : File(path).existsSync() // Check if the file exists
                                  ? Image.file(
                                      File(path),
                                      fit: BoxFit.cover,
                                      height: screenHeight(0.04, context),
                                      width:
                                          screenHeight(0.04, context), // Ensure the image covers the entire container
                                    )
                                  // In case user deletes File path image
                                  : Image.asset(
                                      'assets/images/icons/budgetCategory/piggy.png', // Path to your default image in the assets folder
                                      fit: BoxFit.fill,
                                      height: screenHeight(0.04, context),
                                      width:
                                          screenHeight(0.04, context), // Ensure the image covers the entire container
                                    ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Rs.${savingsList[index].targetAmount}",
                              style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.018, context)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Expanded takes width of parent, it's width of progress bar
                            SizedBox(
                              height: 200,
                              width: screenWidth(0.03, context),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                child: RotatedBox(
                                  quarterTurns: 3, // Rotate by 90 degrees (vertical)
                                  child: LinearProgressIndicator(
                                    minHeight: screenHeight(0.02, context),
                                    value: amountSavedInPercentage == 0 ? 0.008 : amountSavedInPercentage,
                                    color: ColorManager.PROGRESS_BLUE,
                                    backgroundColor: ColorManager.LAVENDER,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          savingsList[index].title,
                          style: TextStyle(
                              color: ColorManager.BLACK_VOID,
                              fontSize: screenHeight(0.022, context),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rs.${savingsList[index].savedAmount} saved of ${savingsList[index].targetAmount}",
                          style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.018, context)),
                        ),
                        Text(
                          "Estimated: ",
                          style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.018, context)),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 12, 12),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: FloatingActionButton.extended(
                                  label: const Text("Add to Savings"),
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    GoRouter.of(context).pushNamed(AppRouteConstants.addSavingsTransaction, extra: savingsList[index]);
                                  })),
                        )
                      ],
                    ),
                  ],
                ),
              ));
        });
  }
}
