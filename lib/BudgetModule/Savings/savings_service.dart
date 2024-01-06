import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_repository.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_repository.dart';
import 'package:budgetlab/Shared/service/external_api_service.dart';

class SavingsService {
  SavingsRepository savingsRepository = SavingsRepository();

  List<Savings> getAllSavingsList() {
    return savingsRepository.getAllSavingsList();
  }

  int addSavings(Savings savings) {
    return savingsRepository.addSavings(savings);
  }

  int updateSavings(Savings savings, String originalTitle) {
    return savingsRepository.updateSavings(savings, originalTitle);
  }

  bool deleteSavingsByTitle(String savingsTitle) {
    return savingsRepository.deleteSavingsByTitle(savingsTitle);
  }
}