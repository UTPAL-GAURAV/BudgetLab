import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import 'package:budgetlab/BudgetModule/History/history_service.dart';

class HistoryController {
  HistoryService historyService = HistoryService();

  List<History> getAllHistoryList() {
    return historyService.getAllHistoryList();
  }

  int addHistory(History history) {
    return historyService.addHistory(history);
  }

  List<History> getAllHistoryListByDate(int year, int month, int date) {
    return historyService.getAllHistoryListByDate(year, month, date);
  }

  List<History> getHistoryListByCategory(String categoryName) {
    return historyService.getHistoryListByCategory(categoryName);
  }

  Set<int> getAllDistinctYears() {
    return historyService.getAllDistinctYears();
  }
}