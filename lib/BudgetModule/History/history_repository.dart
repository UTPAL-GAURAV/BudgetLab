
import 'package:budgetlab/BudgetModule/History/history_entity.dart';

import '../../DB/ObjectBoxManager.dart';
import '../../objectbox.g.dart';

class HistoryRepository {

  List<History> getAllHistoryList() {
    return ObjectBoxManager.historyBox.getAll();
  }

  int addHistory(History history) {
    return ObjectBoxManager.historyBox.put(history);
  }

  Set<int> getAllDistinctYears() {
    return ObjectBoxManager.historyBox.query().build().property(History_.year).find().toSet();
  }

}