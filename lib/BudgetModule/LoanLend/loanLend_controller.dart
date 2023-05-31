import 'package:budgetlab/BudgetModule/LoanLend/loanLend_service.dart';

import 'loanLend_entity.dart';

class LoanLendController {
  LoanLendService loanLendService = LoanLendService();
  List<LoanLend> getAllLoanLendList() {
    return loanLendService.getAllLoanLendList();
  }

  int addLoanLend(LoanLend loanLend) {
    return loanLendService.addLoanLend(loanLend);
  }

  updateLoanLend() {}

  Future<bool> deleteLoanLend(int id) {
    return loanLendService.deleteLoanLend(id);
  }
}
