import 'package:budgetlab/BudgetModule/Budgets/Budget/budget_service.dart';
import 'budget_entity.dart';

class BudgetController {

  BudgetService budgetService = BudgetService();

  List<Budget> getAllBudgetsList() {
    return budgetService.getAllBudgetsList();
  }

  int addBudget(String repeats, int amount) {
    return budgetService.addBudget(repeats, amount);
  }

  updateBudget(int id, String repeats, int amount) {}

  Future<bool> deleteBudget(int id) {
    return budgetService.deleteBudget(id);
  }
}
