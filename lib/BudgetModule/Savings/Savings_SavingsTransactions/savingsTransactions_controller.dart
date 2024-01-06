
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_service.dart';

class SavingsTransactionsController {
  SavingsTransactionsService savingsTransactionsService = SavingsTransactionsService();

  List<SavingsTransactions> getAllSavingsTransactionsList(int savingsId) {
    return savingsTransactionsService.getAllSavingsTransactionsList(savingsId);
  }

  int addSavingsTransaction(SavingsTransactions savingsTransaction) {
    return savingsTransactionsService.addSavingsTransaction(savingsTransaction);
  }
}