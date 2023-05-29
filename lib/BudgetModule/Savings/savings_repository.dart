import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/saings_entity.dart';

import '../../DB/ObjectBoxManager.dart';

class SavingsRepository {
  List<Savings> getAllSavingsList() {
    return ObjectBoxManager.savingsBox.getAll();
  }

  int addOrUpdateSavings(Savings savings) {
    return ObjectBoxManager.savingsBox.put(savings);
  }

}