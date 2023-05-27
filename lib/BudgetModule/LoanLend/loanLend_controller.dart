import 'package:budgetlab/BudgetModule/LoanLend/loanLend_service.dart';

import 'loanLend_entity.dart';

class LoanLendController {
  LoanLendService loanLendService = LoanLendService();
  List<LoanLend> getAllLoanLendList() {
    return loanLendService.getAllLoanLendList();
  }

  int addLoanLend(bool isLoan, DateTime dateTime, DateTime dateOfReturn, int amount, String name, String note, String phone, String returnStatus, String genderEmoji) {
    return loanLendService.addLoanLend(isLoan, dateTime, dateOfReturn, amount, name, note, phone, returnStatus, genderEmoji);
  }

  updateLoanLend() {}

  Future<bool> deleteLoanLend(int id) {
    return loanLendService.deleteLoanLend(id);
  }
}
