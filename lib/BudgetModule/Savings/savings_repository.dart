import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';

import '../../DB/ObjectBoxManager.dart';
import '../../objectbox.g.dart';

class SavingsRepository {
  List<Savings> getAllSavingsList() {
    return ObjectBoxManager.savingsBox.getAll();
  }

  Savings getSavingsById(int savingsId) {
    return ObjectBoxManager.savingsBox.query(Savings_.id.equals(savingsId)).build().find().first;
  }

  int addSavings(Savings savings) {
    return ObjectBoxManager.savingsBox.put(savings);
  }

  int updateSavings(Savings savings) {
    Savings existingSavings = getSavingsById(savings.id);
    existingSavings.title = savings.title;
    existingSavings.targetAmount = savings.targetAmount;
    existingSavings.targetDateTime = savings.targetDateTime;
    existingSavings.icon = savings.icon;
    // Change of Saved Amount is not required. It remains same, as it's handled internally.
    return ObjectBoxManager.savingsBox.put(existingSavings);
  }

  bool deleteSavingsById(int savingsId) {
    return ObjectBoxManager.savingsBox.remove(savingsId);
  }
}