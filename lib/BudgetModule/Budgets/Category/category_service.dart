import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_repository.dart';

class CategoryService {
  CategoryRepository categoryRepository = CategoryRepository();
  List<Category> getAllCategoryList() {
    return categoryRepository.getAllCategoryList();
  }

  int addCategory(Category category) {
    return categoryRepository.addOrUpdateCategory(category);
  }

  updateCategory(Category category, String originalName) {
    return categoryRepository.updateCategory(category, originalName);
  }

  bool deleteCategoryByName(String categoryName) {
    return categoryRepository.deleteCategoryByName(categoryName);
  }

  int updateAmountOfCategory(String name, double amountSpent) {
    Category category = categoryRepository.getCategoryByName(name);
    category.totalAmountSpent = category.totalAmountSpent + amountSpent;
    category.currentCycleAmountLeft = category.currentCycleAmountLeft - amountSpent;
    return categoryRepository.addOrUpdateCategory(category);
  }

  String getIconOfCategoryName(categoryName) {
    return categoryRepository.getIconOfCategoryName(categoryName);
  }

  Category getCategoryByName(categoryName) {
    return categoryRepository.getCategoryByName(categoryName);
  }
}