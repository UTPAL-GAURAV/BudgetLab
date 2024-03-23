import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_service.dart';

import '../../SettingsModule/metadata_controller.dart';


class SavingsController {
  SavingsService savingsService = SavingsService();

  List<Savings> getAllSavingsList() {
    return savingsService.getAllSavingsList();
  }

  int addSavings(Savings savings) {
    return savingsService.addSavings(savings);
  }

  int updateSavings(Savings savings) {
    return savingsService.updateSavings(savings);
  }

  bool deleteSavingsById(int savingsId) {
    return savingsService.deleteSavingsById(savingsId);
  }
}
