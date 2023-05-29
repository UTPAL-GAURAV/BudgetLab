import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_repository.dart';
import 'package:budgetlab/BudgetModule/Savings/saings_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_repository.dart';
import 'package:budgetlab/Shared/service/external_api_service.dart';

class SavingsService {
  SavingsRepository savingsRepository = SavingsRepository();

  List<Savings> getAllSavingsList() {
    return savingsRepository.getAllSavingsList();
  }

  int addOrUpdateSavings(Savings savings) {
    return savingsRepository.addOrUpdateSavings(savings);
  }

}