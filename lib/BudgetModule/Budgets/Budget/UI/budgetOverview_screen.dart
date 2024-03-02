import 'package:budgetlab/BudgetModule/Budgets/Budget/UI/budgetOverviewBody.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/UI/categoryEdit_screen.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/UI/category_screen.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/color_manager.dart';
import 'addIncomeExpense_screen.dart';
import 'budgetHistory.dart';

class BudgetOverviewScreen extends StatefulWidget {
  final Category category;
  const BudgetOverviewScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<BudgetOverviewScreen> createState() => _BudgetOverviewScreenState();
}

class _BudgetOverviewScreenState extends State<BudgetOverviewScreen> {
  late CategoryEditScreen _categoryEditScreen;
  @override
  void initState() {
    super.initState();
    _categoryEditScreen = CategoryEditScreen(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.PRIMARY_BACKGROUND,
          appBar: AppBar(
            backgroundColor: ColorManager.PRIMARY_BLUE,
            foregroundColor: Colors.white,
            title: Text("${widget.category.name}"),
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: ColorManager.LIGHT_GREY2,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.add),
                  child: Text(
                    "Add ${widget.category.transactionType}",
                    // style: TextStyle(
                    //   fontSize: 20,
                    // ),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.history),
                  text: "History",
                ),
                Tab(
                  icon: Icon(Icons.edit),
                  text: "Edit",
                  ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AddIncomeExpenseScreen(category: widget.category,),
              getBudgetHistory(widget.category),
              _categoryEditScreen,
            ],
          ),
        ),
      ),
    );
  }
}
