import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_service.dart';

import 'incomeExpense_entity.dart';

class IncomeExpenseController {
  IncomeExpenseService incomeExpenseService = IncomeExpenseService();

  List<IncomeExpense> getAllIncomeExpenseList() {
    return incomeExpenseService.getAllIncomeExpenseList();
  }

  int addIncomeExpense(IncomeExpense incomeExpense) {
    return incomeExpenseService.addIncomeExpense(incomeExpense);
  }

  updateIncomeExpense() {}

  Future<bool> deleteIncomeExpense(int id) {
    return incomeExpenseService.deleteIncomeExpense(id);
  }
}
