import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';

import '../../Shared/enums_manager.dart';
import '../IncomeExpense/incomeExpense_entity.dart';
import 'history_repository.dart';

class HistoryService {
  HistoryRepository historyRepository = HistoryRepository();

  List<History> getAllHistoryList() {
    return historyRepository.getAllHistoryList();
  }

  int addHistoryFromIncomeExpense(IncomeExpense incomeExpense) {
    History history = History(
        year: incomeExpense.dateTime.year,
        month: incomeExpense.dateTime.month,
        date: incomeExpense.dateTime.day,
        day: incomeExpense.dateTime.weekday,
        title: incomeExpense.note,
        amount: incomeExpense.amount,
        isIncome: incomeExpense.isIncome,
        category: TransactionCategory.incomeExpense.toString());
    return addHistory(history);
  }

  int addHistoryFromLoanLend(LoanLend loanLend) {
    History history = History(
        year: loanLend.dateTime.year,
        month: loanLend.dateTime.month,
        date: loanLend.dateTime.day,
        day: loanLend.dateTime.weekday,
        title: loanLend.note,
        amount: loanLend.amount,
        isIncome: loanLend.isLoan,
        category: TransactionCategory.loanLend.toString());
    return addHistory(history);
  }

  int addHistory(History history) {
    return historyRepository.addHistory(history);
  }

  Set<int> getAllDistinctYears() {
    return historyRepository.getAllDistinctYears();
  }

}
