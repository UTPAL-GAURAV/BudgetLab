import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_service.dart';


class SavingsController {
  SavingsService savingsService = SavingsService();

  List<Savings> getAllSavingsList() {
    return savingsService.getAllSavingsList();
  }

  int addSavings(Savings savings) {
    return savingsService.addSavings(savings);
  }

  int updateSavings(Savings savings, String originalTitle) {
    return savingsService.updateSavings(savings, originalTitle);
  }

  bool deleteSavingsByTitle(String savingsTitle) {
    return savingsService.deleteSavingsByTitle(savingsTitle);
  }
}
