
import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/SettingsModule/metadata_controller.dart';
import 'package:budgetlab/Shared/constants_manager.dart';

String validateNothing(value) {
  return "";
}

String validateNameField(value) {
  if (value == null || value.isEmpty) {
    return ConstantsManager.NO_TEXT;
  }
  return "";
}

// Validates Income - basically all incoming transactions
String validateAmountField(value) {
  if (value == null || value.isEmpty) {
    return ConstantsManager.NOT_VALID_AMOUNT;
  }
  try {
    value = double.parse(value);
  } catch (e) {
    return ConstantsManager.NOT_VALID_AMOUNT;
  }
  if (!(value > 0 && value < 99999990)) {
    // Nine Crore...
    return ConstantsManager.NOT_VALID_AMOUNT;
  }
  return "";
}

// Validates Expense, Lend, Investment, new Savings transaction - basically all outgoing transactions
String validateLendExpenseField(value) {
  MetaDataController metaDataController = MetaDataController();
  String response = validateAmountField(value);
  if(response.isEmpty && (double.parse(value) > metaDataController.getCurrentBalance())) {
    return ConstantsManager.NOT_ENOUGH_BALANCE;
  }
  return response;
}

// Validates duplicate names of Category/Budget field
String validateCategoryDuplicateValueField(String value) {
  CategoryController categoryController = CategoryController();
  List<Category> categoryList = categoryController.getAllCategoryList();
  String response = validateNameField(value);
  for (Category element in categoryList) {
    if (element.name.toLowerCase() == value.toLowerCase()) {
      return ConstantsManager.DUPLICATE_TEXT;
    }
  }
  return response;
}


