import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_entity.dart';

import '../../DB/ObjectBoxManager.dart';

class IncomeExpenseRepository {
  List<IncomeExpense> getAllIncomeExpenseList() {
    return ObjectBoxManager.incomeExpenseBox.getAll();
  }

  int addOrUpdateIncomeExpense(IncomeExpense incomeExpense) {
    return ObjectBoxManager.incomeExpenseBox.put(incomeExpense);
  }

  Future<bool> deleteIncomeExpense(int id) {
    return ObjectBoxManager.incomeExpenseBox.removeAsync(id);
  }
}