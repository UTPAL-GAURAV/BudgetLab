

import 'dart:html';

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
}