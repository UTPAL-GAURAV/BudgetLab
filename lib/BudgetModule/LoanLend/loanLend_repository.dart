import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';

import '../../DB/ObjectBoxManager.dart';

class LoanLendRepository {
  List<LoanLend> getAllLoanLendList() {
    return ObjectBoxManager.loanLendBox.getAll();
  }

  int addOrUpdateLoanLend(LoanLend loanLend) {
    return ObjectBoxManager.loanLendBox.put(loanLend);
  }

  Future<bool> deleteLoanLend(int id) {
    return ObjectBoxManager.loanLendBox.removeAsync(id);
  }
}