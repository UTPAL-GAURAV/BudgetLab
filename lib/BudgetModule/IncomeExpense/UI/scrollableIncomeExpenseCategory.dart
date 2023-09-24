import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/enums_manager.dart';
import 'package:budgetlab/Shared/service/providers/incomeExpense_provider.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Shared/routes_manager.dart';

/// Public Method //////////////////////////////////////////////////////////////

getScrollableIncomeExpenseCategory(onCategorySelectedCallback) {
  return ScrollableIncomeExpenseCategory(
      onCategorySelected: onCategorySelectedCallback);
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableIncomeExpenseCategory extends StatefulWidget {
  final Function(String) onCategorySelected;
  ScrollableIncomeExpenseCategory({Key? key, required this.onCategorySelected})
      : super(key: key);

  @override
  State<ScrollableIncomeExpenseCategory> createState() =>
      _ScrollableIncomeExpenseCategoryState();
}

class _ScrollableIncomeExpenseCategoryState
    extends State<ScrollableIncomeExpenseCategory> {
  int allCategoryListLength = 0;
  late ValueNotifier<List<Category>> allCategoryList;

  CategoryController categoryController = CategoryController();

  @override
  void initState() {
    super.initState();
    allCategoryList = ValueNotifier<List<Category>>([]);
    fetchData();
  }

  void fetchData() async {
    List<Category> fetchedData = await categoryController.getAllCategoryList();
    allCategoryList.value = fetchedData;
    allCategoryListLength = fetchedData.length;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IncomeExpenseProvider>(builder: (context, provider, child) {
      return ValueListenableBuilder<List<Category>>(
        valueListenable: allCategoryList,
        builder: (context, categoryList, _) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                    categoryList.length,
                    (index) {
                      final category = categoryList[index];
                      bool isSelected = provider.selectedCategory == index;
                      return GestureDetector(
                        onTap: () => {
                          provider.setTransactionType(parseTransactionType(category.transactionType)),
                          provider.setSelectedCategory(index),
                          widget.onCategorySelected(category.name)
                        },
                        child: Container(
                          // Adjust the padding between buttons
                          margin: const EdgeInsets.all(6),
                          child: getIconWithLabelButtons(category, context, isSelected),
                        ),
                      );
                    },
                  ) +
                  [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: routes['/category']!));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        child: getLastIconEditButton(context),
                      ),
                    ),
                  ],
            ),
          );
        },
      );
    });
  }
}
