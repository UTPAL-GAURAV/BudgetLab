import 'package:budgetlab/BudgetModule/History/history_service.dart';
import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_entity.dart';

import 'incomeExpense_repository.dart';

class IncomeExpenseService {
  IncomeExpenseRepository incomeExpenseRepository = IncomeExpenseRepository();
  HistoryService historyService = HistoryService();

  List<IncomeExpense> getAllIncomeExpenseList() {
    return incomeExpenseRepository.getAllIncomeExpenseList();
  }

  int addIncomeExpense(IncomeExpense incomeExpense) {
    historyService.addHistoryFromIncomeExpense(incomeExpense);
    return incomeExpenseRepository.addOrUpdateIncomeExpense(incomeExpense);
  }

  updateIncomeExpense() {}

  Future<bool> deleteIncomeExpense(int id) {
    return incomeExpenseRepository.deleteIncomeExpense(id);
  }
}