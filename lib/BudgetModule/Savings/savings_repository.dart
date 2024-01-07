import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';

import '../../DB/ObjectBoxManager.dart';
import '../../objectbox.g.dart';

class SavingsRepository {
  List<Savings> getAllSavingsList() {
    return ObjectBoxManager.savingsBox.getAll();
  }

  int addSavings(Savings savings) {
    return ObjectBoxManager.savingsBox.put(savings);
  }

  int updateSavings(Savings savings, String originalTitle) {
    Savings existingSavings = getSavingsByTitle(originalTitle);
    existingSavings.title = savings.title;
    existingSavings.targetAmount = savings.targetAmount;
    existingSavings.targetDateTime = savings.targetDateTime;
    existingSavings.icon = savings.icon;
    // Change of Saved Amount is not required. It remains same, as it's handled internally.
    return ObjectBoxManager.savingsBox.put(existingSavings);
  }

  Savings getSavingsByTitle(String title) {
    return ObjectBoxManager.savingsBox.query(Savings_.title.equals(title)).build().find().first;
  }

  bool deleteSavingsByTitle(String savingsTitle) {
    final Savings savings = getSavingsByTitle(savingsTitle);
    return ObjectBoxManager.savingsBox.remove(savings.id);
  }
}