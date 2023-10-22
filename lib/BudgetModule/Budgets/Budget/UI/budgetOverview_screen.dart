import 'package:budgetlab/BudgetModule/Budgets/Budget/UI/budgetOverviewBody.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/UI/categoryEdit_screen.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/UI/category_screen.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:flutter/material.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/color_manager.dart';

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
    return Scaffold(
      backgroundColor: ColorManager.PRIMARY_BACKGROUND,
      appBar: AppBar(
        backgroundColor: ColorManager.PRIMARY_BLUE,
        title: Text("${widget.category.name}   (Editing)"),
      ),
      body: _categoryEditScreen,
      );
  }
}
