import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import 'package:budgetlab/BudgetModule/History/history_service.dart';

class IncomeExpenseController {
  HistoryService historyService = HistoryService();
  int addIncomeExpense(History history) {
    //TODO: Update Category table
    return historyService.addHistory(history);
  }
}
