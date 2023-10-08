import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import 'package:budgetlab/BudgetModule/History/history_service.dart';

class IncomeExpenseController {
  HistoryService historyService = HistoryService();
  CategoryController categoryController = CategoryController();

  int addIncomeExpense(History history) {
    //TODO: Update Category table
    categoryController.updateAmountOfCategory(history.category, history.amount);
    return historyService.addHistory(history);
  }
}
