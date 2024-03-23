
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_repository.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_repository.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_service.dart';
import 'package:budgetlab/SettingsModule/metadata_controller.dart';
import 'package:budgetlab/SettingsModule/metadata_service.dart';

class SavingsTransactionsService {
  SavingsTransactionsRepository savingsTransactionsRepository = SavingsTransactionsRepository();
  SavingsService savingsService = SavingsService();
  MetadataService metadataService = MetadataService();

  List<SavingsTransactions> getAllSavingsTransactionsList(int savingsId) {
    return savingsTransactionsRepository.getAllSavingsTransactionsList(savingsId);
  }

  int addSavingsTransaction(SavingsTransactions savingsTransaction) {
    updateAmountOfSavings(savingsTransaction.savingsId, savingsTransaction.amount);
    metadataService.updateExpendableAmount(false, savingsTransaction.amount, false, false);
    return savingsTransactionsRepository.addSavingsTransaction(savingsTransaction);
  }

  int updateAmountOfSavings(int savingsId, double amount) {
    return savingsService.updateSavingsSavedAmount(savingsId, amount);
  }
}