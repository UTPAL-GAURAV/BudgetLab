
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_repository.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_repository.dart';

class SavingsTransactionsService {
  SavingsTransactionsRepository savingsTransactionsRepository = SavingsTransactionsRepository();

  List<SavingsTransactions> getAllSavingsTransactionsList(int savingsId) {
    return savingsTransactionsRepository.getAllSavingsTransactionsList(savingsId);
  }

  int addSavingsTransaction(SavingsTransactions savingsTransaction) {
    return savingsTransactionsRepository.addSavingsTransaction(savingsTransaction);
  }
}