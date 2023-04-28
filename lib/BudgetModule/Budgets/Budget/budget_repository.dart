import '../../../DB/ObjectBoxManager.dart';
import 'budget_entity.dart';

class BudgetRepository {
  List<Budget> getAllBudgetsList() {
    return ObjectBoxManager.budgetBox.getAll();
  }

  // Will update entry if it already exists or will create a new entry
  int addOrUpdateBudget(Budget budget) {
    return ObjectBoxManager.budgetBox.put(budget);
  }

  Future<bool> deleteBudget(int id) {
    return ObjectBoxManager.budgetBox.removeAsync(id);
  }
}