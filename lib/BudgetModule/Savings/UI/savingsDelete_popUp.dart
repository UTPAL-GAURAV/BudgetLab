import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Shared/routes_manager.dart';
savingsDeletePopUp(BuildContext context, String categoryName) {
  SavingsController _savingsController = SavingsController();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to delete this saving?'),
          actions: [
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                // _savingsController.deleteCategoryByName(categoryName);
                GoRouter.of(context).pushNamed(AppRouteConstants.savings);
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      });
}
