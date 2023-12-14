import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';

import '../../Shared/enums_manager.dart';
import 'history_repository.dart';

class HistoryService {
  HistoryRepository historyRepository = HistoryRepository();

  List<History> getAllHistoryList() {
    return historyRepository.getAllHistoryList();
  }

  List<History> getCustomHistoryList(int year, int month, int date) {
    if(month==0 && date==0) {
      return historyRepository.getHistoryListByYear(year);
    } else if(date==0) {
      return historyRepository.getHistoryListByMonth(year, month);
    }
    return historyRepository.getHistoryListByDate(year, month, date);
  }

  int addHistoryFromLoanLend(LoanLend loanLend) {
    History history = History(
        year: loanLend.dateTime.year,
        month: loanLend.dateTime.month,
        date: loanLend.dateTime.day,
        day: loanLend.dateTime.weekday,
        dateTime: loanLend.dateTime,
        name: loanLend.name,  // Stores name in case of Loan Lend
        amount: loanLend.amount,
        isIncome: loanLend.isLoan,
        category: TransactionCategory.loanLend.name,
    //TODO: add icon or default icon
    icon: ''); // Stores TransactionCategory in case of Loan Lend
    return addHistory(history);
  }

  int addHistory(History history) {
    return historyRepository.addHistory(history);
  }

  Set<int> getAllDistinctYears() {
    return historyRepository.getAllDistinctYears();
  }

}
