import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:flutter/material.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/color_manager.dart';

/// Public Method //////////////////////////////////////////////////////////////

getBudgetOverViewBody(Category category) {
  return BudgetOverviewBody(category: category);
}

/// Widget /////////////////////////////////////////////////////////////////////

class BudgetOverviewBody extends StatefulWidget {
  final Category category;
  const BudgetOverviewBody({Key? key, required this.category}) : super(key: key);

  @override
  State<BudgetOverviewBody> createState() => _BudgetOverviewBodyState();
}

class _BudgetOverviewBodyState extends State<BudgetOverviewBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.01, context),
            screenWidth(0.02, context), screenHeight(0.01, context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight(0.01, context), bottom: screenHeight(0.01, context)),
                child: Text(
                  "History",
                  style:
                  TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
