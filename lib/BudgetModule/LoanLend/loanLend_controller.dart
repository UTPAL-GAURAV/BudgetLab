import 'package:budgetlab/BudgetModule/LoanLend/loanLend_service.dart';

import 'loanLend_entity.dart';

class LoanLendController {
  LoanLendService loanLendService = LoanLendService();
  List<LoanLend> getAllLoanLendList() {
    return loanLendService.getAllLoanLendList();
  }

  int addLoanLend(bool isLoan, DateTime dateTime, DateTime dateOfReturn, int amount, String note, String phone, String returnStatus) {
    return loanLendService.addLoanLend(isLoan, dateTime, dateOfReturn, amount, note, phone, returnStatus);
  }

  updateLoanLend() {}

  Future<bool> deleteLoanLend(int id) {
    return loanLendService.deleteLoanLend(id);
  }
}
