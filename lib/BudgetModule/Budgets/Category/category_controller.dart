import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_service.dart';

class CategoryController {
  CategoryService categoryService = CategoryService();
  List<Category> getAllCategoryList() {
    return categoryService.getAllCategoryList();
  }

  int addCategory(Category category) {
    return categoryService.addCategory(category);
  }

  updateCategory() {}

  Future<bool> deleteCategory(int id) {
    return categoryService.deleteCategory(id);
  }

  updateAmountOfCategory(String category, double amountSpent) {
    return categoryService.updateAmountOfCategory(category, amountSpent);
  }
}
