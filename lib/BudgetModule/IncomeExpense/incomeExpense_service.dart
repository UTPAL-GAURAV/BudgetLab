import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_entity.dart';

import 'incomeExpense_repository.dart';

class IncomeExpenseService {
  IncomeExpenseRepository incomeExpenseRepository = IncomeExpenseRepository();

  List<IncomeExpense> getAllIncomeExpenseList() {
    return incomeExpenseRepository.getAllIncomeExpenseList();
  }

  int addIncomeExpense(int id, bool isIncome, DateTime dateTime, int amount, String note, String category) {
    return incomeExpenseRepository.addOrUpdateIncomeExpense(IncomeExpense(isIncome: isIncome, dateTime: dateTime, amount: amount, category: category));
  }

  updateIncomeExpense() {}

  Future<bool> deleteIncomeExpense(int id) {
    return incomeExpenseRepository.deleteIncomeExpense(id);
  }
}