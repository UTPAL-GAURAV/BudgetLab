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

  int updateCategory(Category category, String originalName) {
    Category existingCategory = getCategoryByName(originalName);
    existingCategory.name = category.name;
    existingCategory.icon = category.icon;
    existingCategory.isCap = category.isCap;
    existingCategory.cycle = category.cycle;
    existingCategory.cycleBudget = category.cycleBudget;
    existingCategory.addToNextCycle = category.addToNextCycle;
    return ObjectBoxManager.categoryBox.put(existingCategory);
  }

  bool deleteCategoryByName(String categoryName) {
    final Category category = getCategoryByName(categoryName);
    return ObjectBoxManager.categoryBox.remove(category.id);
  }

  String getIconOfCategoryName(String categoryName) {
    return ObjectBoxManager.categoryBox.query(Category_.name.equals(categoryName)).build().find().first.icon;
  }
}