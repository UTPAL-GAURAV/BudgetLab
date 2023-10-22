import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Shared/routes_manager.dart';

categoryDeletePopUp(BuildContext context, String categoryName) {
  CategoryController _categoryController = CategoryController();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to delete this budget?'),
          actions: [
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                _categoryController.deleteCategoryByName(categoryName);
                GoRouter.of(context).pushNamed(AppRouteConstants.budget);
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
