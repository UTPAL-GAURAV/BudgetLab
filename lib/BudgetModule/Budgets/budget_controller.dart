import 'package:budgetlab/DB/ObjectBoxManager.dart';
import 'budget_entity.dart';

class BudgetController {
  getAllBudgetsList() async {
    var budget = Budget(repeats: "yea", amount: 100);
    final userBox = ObjectBoxManager.store.box<Budget>();
    // If id exists updates the object else creates new object
    userBox.put(budget);
    print("xxxxxxxxx");
    print(userBox.getAll());
  }

  addBudget() {}

  updateBudget() {}

  deleteBudget() {}
}
