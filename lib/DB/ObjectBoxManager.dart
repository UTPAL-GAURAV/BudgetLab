import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/Budgets/Cycles/cycleSavings_entity.dart';
import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/saings_entity.dart';
import 'package:budgetlab/SettingsModule/metadata_entity.dart';
import 'package:flutter/widgets.dart';
import '../BudgetModule/Budgets/Budget/budget_entity.dart';
import '../objectbox.g.dart';

/**
 * Open and close ObjectBox store access.
 */
class ObjectBoxManager {
  static late Store store;
  static late Box<Budget> budgetBox;
  static late Box<Category> categoryBox;
  static late Box<CycleSavings> cycleSavingsBox;
  static late Box<LoanLend> loanLendBox;
  static late Box<Metadata> metadataBox;
  static late Box<Savings> savingsBox;
  static late Box<History> historyBox;

  static Future<void> openObjectBoxStore() async {
    // Open ObjectBox Store to use DB
      WidgetsFlutterBinding.ensureInitialized();
      store = await openStore();

      // Create Box of all entities
      budgetBox = ObjectBoxManager.store.box<Budget>();
      categoryBox = ObjectBoxManager.store.box<Category>();
      cycleSavingsBox = ObjectBoxManager.store.box<CycleSavings>();
      loanLendBox = ObjectBoxManager.store.box<LoanLend>();
      metadataBox = ObjectBoxManager.store.box<Metadata>();
      savingsBox = ObjectBoxManager.store.box<Savings>();
      historyBox = ObjectBoxManager.store.box<History>();
  }

  static void closeObjectBoxStore() {
      store.close();
  }
}
