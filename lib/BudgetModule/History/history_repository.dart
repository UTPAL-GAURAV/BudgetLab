import 'package:budgetlab/BudgetModule/History/history_entity.dart';

import '../../DB/ObjectBoxManager.dart';
import '../../objectbox.g.dart';

class HistoryRepository {
  List<History> getAllHistoryList() {
    return ObjectBoxManager.historyBox.getAll();
  }

  List<History> getHistoryListByYear(int year) {
    return ObjectBoxManager.historyBox
        .query(History_.year.equals(year))
        .order(History_.dateTime, flags: Order.descending)
        .build()
        .find();
  }

  List<History> getHistoryListByMonth(int year, int month) {
    return ObjectBoxManager.historyBox
        .query(History_.year.equals(year).and(History_.month.equals(month)))
        .order(History_.dateTime, flags: Order.descending)
        .build()
        .find();
  }

  List<History> getHistoryListByDate(int year, int month, int date) {
    return ObjectBoxManager.historyBox
        .query(History_.year.equals(year).and(History_.month.equals(month)).and(History_.date.equals(date)))
        .order(History_.dateTime, flags: Order.descending)
        .build()
        .find();
  }

  List<History> getHistoryListByCategory(String categoryName) {
    return ObjectBoxManager.historyBox
        .query(History_.category.equals(categoryName))
        .order(History_.dateTime, flags: Order.descending)
        .build()
        .find();
  }

  int addHistory(History history) {
    return ObjectBoxManager.historyBox.put(history);
  }

  Set<int> getAllDistinctYears() {
    return ObjectBoxManager.historyBox.query().build().property(History_.year).find().toSet();
  }
}
