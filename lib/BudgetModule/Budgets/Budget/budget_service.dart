
import 'package:budgetlab/BudgetModule/Budgets/Budget/budget_repository.dart';

import 'budget_entity.dart';

class BudgetService {

  BudgetRepository budgetRepository = BudgetRepository();

  List<Budget> getAllBudgetsList() {
    return budgetRepository.getAllBudgetsList();
  }

  int addBudget(String repeats, int amount) {
    return budgetRepository.addOrUpdateBudget(Budget(repeats: repeats, amount: amount));
  }

  updateBudget() {}

  Future<bool> deleteBudget(int id) {
    return budgetRepository.deleteBudget(id);
  }
}