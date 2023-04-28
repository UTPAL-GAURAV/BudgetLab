import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';

import '../../../DB/ObjectBoxManager.dart';
class CategoryRepository {
  List<Category> getAllCategoryList() {
    return ObjectBoxManager.categoryBox.getAll();
  }

  // Will update entry if it already exists or will create a new entry
  int addOrUpdateCategory(Category category) {
    return ObjectBoxManager.categoryBox.put(category);
  }

  Future<bool> deleteCategory(int id) {
    return ObjectBoxManager.categoryBox.removeAsync(id);
  }
}