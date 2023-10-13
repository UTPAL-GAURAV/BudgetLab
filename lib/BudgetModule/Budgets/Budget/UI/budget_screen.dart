
import 'package:budgetlab/BudgetModule/Budgets/Budget/UI/unCappedBudget.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/routes_manager.dart';
import 'cappedBudget.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Budgets"),
          backgroundColor: ColorManager.PRIMARY_BLUE,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                GoRouter.of(context).pushNamed('category');
                // Navigator.push(
                //     context, MaterialPageRoute(builder: routes['/category']!));
              },
            ),
          ],
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
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight(0.01, context), bottom: screenHeight(0.01, context)),
                  child: Text(
                    "Capped Budget",
                    style:
                    TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: getCappedBudget(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight(0.04, context), bottom: screenHeight(0.01, context)),
                  child: Text(
                    "Un-capped Budget",
                    style:
                    TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: getUnCappedBudget(),
                ),
              ],
            ),
          )),
      ),
    );
  }
}
