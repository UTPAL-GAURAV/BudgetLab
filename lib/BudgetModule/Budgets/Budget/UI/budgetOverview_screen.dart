import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:flutter/material.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/color_manager.dart';

class BudgetOverviewScreen extends StatefulWidget {
  final Category category;
  // const BudgetOverviewScreen({Key? key, required this.category}) : super(key: key);
  BudgetOverviewScreen({required this.category});

  @override
  State<BudgetOverviewScreen> createState() => _BudgetOverviewScreenState();
}

class _BudgetOverviewScreenState extends State<BudgetOverviewScreen> {
  // _BudgetOverviewScreenState({required this.category});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budgets"),
        backgroundColor: ColorManager.PRIMARY_BLUE,
      ),
      body: Container(
        color: ColorManager.PRIMARY_BACKGROUND,
        width: MediaQuery.of(context).size.width,
        height: screenHeight(1.0, context) - AppBar().preferredSize.height,
        child: Padding(
          padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.01, context),
              screenWidth(0.02, context), screenHeight(0.01, context)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
