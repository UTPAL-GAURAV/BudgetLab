
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_entity.dart';
import 'package:budgetlab/objectbox.g.dart';

import '../../../DB/ObjectBoxManager.dart';

class SavingsTransactionsRepository {

  List<SavingsTransactions> getAllSavingsTransactionsList(int savingsId) {
    return ObjectBoxManager.savingsTransactionsBox.query(SavingsTransactions_.savingsId.equals(savingsId)).build().find();
  }

  int addSavingsTransaction(SavingsTransactions savingsTransaction) {
    return ObjectBoxManager.savingsTransactionsBox.put(savingsTransaction);
  }
}