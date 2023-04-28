import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_service.dart';

class CategoryController {
  CategoryService categoryService = CategoryService();
  List<Category> getAllCategoryList() {
    return categoryService.getAllCategoryList();
  }

  int addCategory(bool isExpense, String name, String icon) {
    return categoryService.addCategory(isExpense, name, icon);
  }

  updateCategory() {}

  Future<bool> deleteCategory(int id) {
    return categoryService.deleteCategory(id);
  }
}
