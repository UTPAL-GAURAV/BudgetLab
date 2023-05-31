import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_service.dart';
import 'package:budgetlab/BudgetModule/Savings/saings_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_service.dart';


class SavingsController {
  SavingsService savingsService = SavingsService();

  List<Savings> getAllSavingsList() {
    return savingsService.getAllSavingsList();
  }

  int addSavings(Savings savings) {
    return savingsService.addOrUpdateSavings(savings);
  }
}
