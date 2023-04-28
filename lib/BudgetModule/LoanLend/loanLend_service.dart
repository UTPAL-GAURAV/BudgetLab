import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_repository.dart';

class LoanLendService {
  LoanLendRepository loanLendRepository = LoanLendRepository();
  List<LoanLend> getAllLoanLendList() {
    return loanLendRepository.getAllLoanLendList();
  }

  int addLoanLend(bool isLoan, DateTime dateTime, DateTime dateOfReturn, int amount, String note, String phone, String returnStatus) {
    return loanLendRepository.addOrUpdateLoanLend(LoanLend(isLoan: isLoan, dateTime: dateTime, dateOfReturn: dateOfReturn, amount: amount, returnStatus: returnStatus));
  }

  updateLoanLend() {}

  Future<bool> deleteLoanLend(int id) {
    return loanLendRepository.deleteLoanLend(id);
  }
}