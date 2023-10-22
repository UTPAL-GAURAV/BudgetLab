import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_service.dart';

import '../../../Shared/service/common_service.dart';

class CategoryController {
  CategoryService categoryService = CategoryService();
  List<Category> getAllCategoryList() {
    return categoryService.getAllCategoryList();
  }

  int addCategory(Category category) {
    return categoryService.addCategory(category);
  }

  updateCategory(Category category, String originalName) {
    return categoryService.updateCategory(category, originalName);
  }

  bool deleteCategoryByName(String categoryName) {
    return categoryService.deleteCategoryByName(categoryName);
  }

  updateAmountOfCategory(String categoryName, double amountSpent, DateTime dateTime) {
    Category category = categoryService.getCategoryByName(categoryName);
    // Update Budget Category only if it is in current cycle
    // If isCap is true and date is out of current cycle, then ignore
    // Note: Future dates should never be set while updating Budget Category
    if(category.isCap==true && checkIfCurrentDateIsWithinCurrentCycle(category.cycle, dateTime)) {
      return categoryService.updateAmountOfCategory(categoryName, amountSpent);
    } else if(category.isCap==false) {
      return categoryService.updateAmountOfCategory(categoryName, amountSpent);
    }
  }

  String getIconOfCategoryName(String categoryName) {
    return categoryService.getIconOfCategoryName(categoryName);
  }

  Category getCategoryByName(String categoryName) {
    return categoryService.getCategoryByName(categoryName);
  }
}
