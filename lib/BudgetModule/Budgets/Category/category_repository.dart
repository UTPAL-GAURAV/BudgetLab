import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/objectbox.g.dart';

import '../../../DB/ObjectBoxManager.dart';


class CategoryRepository {
  List<Category> getAllCategoryList() {
    return ObjectBoxManager.categoryBox.getAll();
  }

  Category getCategoryByName(String name) {
    return ObjectBoxManager.categoryBox.query(Category_.name.equals(name)).build().find().first;
  }

  // Will update entry if it already exists or will create a new entry
  int addOrUpdateCategory(Category category) {
    return ObjectBoxManager.categoryBox.put(category);
  }

  Future<bool> deleteCategory(int id) {
    return ObjectBoxManager.categoryBox.removeAsync(id);
  }
}