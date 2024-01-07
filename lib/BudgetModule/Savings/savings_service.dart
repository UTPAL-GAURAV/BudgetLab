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

  int addSavings(Savings savings) {
    // Adding to Savings means minus from Expendable Amount
    metaDataController.updateExpendableAmount(false, savings.savedAmount, false, false);
    return savingsRepository.addSavings(savings);
  }

  int updateSavings(Savings savings, String originalTitle) {
    // Updating Savings does not change Saved Amount, so no Expendable Amount update is needed
    return savingsRepository.updateSavings(savings, originalTitle);
  }

  bool deleteSavingsByTitle(String savingsTitle) {
    // Deleting Savings must free up blocked amount, means add to Expendable Amount
    metaDataController.updateExpendableAmount(
        true, savingsRepository.getSavingsByTitle(savingsTitle).savedAmount, false, false);
    return savingsRepository.deleteSavingsByTitle(savingsTitle);
  }
}
