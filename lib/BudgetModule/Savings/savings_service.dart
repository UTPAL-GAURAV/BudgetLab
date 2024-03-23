import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_repository.dart';
import 'package:budgetlab/Shared/service/external_api_service.dart';

import '../../SettingsModule/metadata_controller.dart';

class SavingsService {
  SavingsRepository savingsRepository = SavingsRepository();
  MetaDataController metaDataController = MetaDataController();

  List<Savings> getAllSavingsList() {
    return savingsRepository.getAllSavingsList();
  }

  Savings getSavingsById(int savingsId) {
    return savingsRepository.getSavingsById(savingsId);
  }

  int addSavings(Savings savings) {
    // Adding to Savings means minus from Expendable Amount
    metaDataController.updateExpendableAmount(false, savings.savedAmount, false, false);
    return savingsRepository.addSavings(savings);
  }

  int updateSavings(Savings savings) {
    // Updating Savings does not change Saved Amount, so no Expendable Amount update is needed
    return savingsRepository.updateSavings(savings);
  }

  int updateSavingsSavedAmount(int savingsId, double amount) {
    Savings existingSavings = savingsRepository.getSavingsById(savingsId);
    existingSavings.savedAmount = existingSavings.savedAmount + amount;
    return savingsRepository.addSavings(existingSavings);
  }

  bool deleteSavingsById(int savingsId) {
    // Deleting Savings must free up blocked amount, means add to Expendable Amount
    metaDataController.updateExpendableAmount(
        true, savingsRepository.getSavingsById(savingsId).savedAmount, false, false);
    return savingsRepository.deleteSavingsById(savingsId);
  }
}
