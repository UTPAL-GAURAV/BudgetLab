import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_entity.dart';

import 'incomeExpense_repository.dart';

class IncomeExpenseService {
  IncomeExpenseRepository incomeExpenseRepository = IncomeExpenseRepository();

  List<IncomeExpense> getAllIncomeExpenseList() {
    return incomeExpenseRepository.getAllIncomeExpenseList();
  }

  int addIncomeExpense(IncomeExpense incomeExpense) {
    return incomeExpenseRepository.addOrUpdateIncomeExpense(incomeExpense);
  }

  updateIncomeExpense() {}

  Future<bool> deleteIncomeExpense(int id) {
    return incomeExpenseRepository.deleteIncomeExpense(id);
  }
}