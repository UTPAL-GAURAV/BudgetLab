import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_repository.dart';

class CategoryService {
  CategoryRepository categoryRepository = CategoryRepository();
  List<Category> getAllCategoryList() {
    return categoryRepository.getAllCategoryList();
  }

  int addCategory(bool isExpense, String name, String icon) {
    return categoryRepository.addOrUpdateCategory(Category(isExpense: isExpense, name: name));
  }

  updateCategory() {}

  Future<bool> deleteCategory(int id) {
    return categoryRepository.deleteCategory(id);
  }
}