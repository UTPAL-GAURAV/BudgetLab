import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_repository.dart';
import 'package:budgetlab/Shared/external_api_service.dart';

class LoanLendService {
  LoanLendRepository loanLendRepository = LoanLendRepository();
  ExternalApiService externalApiService = ExternalApiService();

  List<LoanLend> getAllLoanLendList() {
    return loanLendRepository.getAllLoanLendList();
  }

  int addLoanLend(bool isLoan, DateTime dateTime, DateTime dateOfReturn, int amount, String name, String note, String phone, String returnStatus, String genderEmoji) {

    return loanLendRepository.addOrUpdateLoanLend(LoanLend(isLoan: isLoan, dateTime: dateTime, dateOfReturn: dateOfReturn, amount: amount, name: name, note: note, phone: phone,returnStatus: returnStatus, genderEmoji: genderEmoji));
  }

  updateLoanLend() {}

  Future<bool> deleteLoanLend(int id) {
    return loanLendRepository.deleteLoanLend(id);
  }
}