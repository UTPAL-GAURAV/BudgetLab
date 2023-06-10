import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_repository.dart';
import 'package:budgetlab/Shared/service/external_api_service.dart';

class LoanLendService {
  LoanLendRepository loanLendRepository = LoanLendRepository();
  ExternalApiService externalApiService = ExternalApiService();

  List<LoanLend> getAllLoanLendList() {
    return loanLendRepository.getAllLoanLendList();
  }

  int addLoanLend(LoanLend loanLend) {

    return loanLendRepository.addOrUpdateLoanLend(loanLend);
  }

  updateLoanLend() {}

  Future<bool> deleteLoanLend(int id) {
    return loanLendRepository.deleteLoanLend(id);
  }
}