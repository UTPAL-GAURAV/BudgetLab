import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/Budgets/Cycles/cycleSavings_entity.dart';
import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:budgetlab/FairShareModule/FairShare_Entities/friends_entity.dart';
import 'package:budgetlab/FairShareModule/FairShare_Entities/group_entity.dart';
import 'package:budgetlab/FairShareModule/FairShare_Entities/group_members_entity.dart';
import 'package:budgetlab/FairShareModule/FairShare_Entities/split_transaction_entity.dart';
import 'package:budgetlab/FairShareModule/FairShare_Entities/transactions_entity.dart';
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
  static late Box<Metadata> metadataBox;
  static late Box<Savings> savingsBox;
  static late Box<SavingsTransactions> savingsTransactionsBox;
  static late Box<History> historyBox;

  // FairShare Module
  static late Box<Group> groupBox;
  static late Box<GroupMembers> groupMembersBox;
  static late Box<Friends> friendsBox;
  static late Box<SplitTransaction> splitTransactionBox;
  static late Box<Transactions> transactionsBox;

  static Future<void> openObjectBoxStore() async {
    // Open ObjectBox Store to use DB
      WidgetsFlutterBinding.ensureInitialized();
      store = await openStore();

      // Create Box of all entities
      budgetBox = ObjectBoxManager.store.box<Budget>();
      categoryBox = ObjectBoxManager.store.box<Category>();
      cycleSavingsBox = ObjectBoxManager.store.box<CycleSavings>();
      metadataBox = ObjectBoxManager.store.box<Metadata>();
      savingsBox = ObjectBoxManager.store.box<Savings>();
      savingsTransactionsBox = ObjectBoxManager.store.box<SavingsTransactions>();
      historyBox = ObjectBoxManager.store.box<History>();

    // Create Box of all entities of FairShare Module
      groupBox = ObjectBoxManager.store.box<Group>();
      groupMembersBox = ObjectBoxManager.store.box<GroupMembers>();
      friendsBox = ObjectBoxManager.store.box<Friends>();
      splitTransactionBox = ObjectBoxManager.store.box<SplitTransaction>();
      transactionsBox = ObjectBoxManager.store.box<Transactions>();
  }

  static void closeObjectBoxStore() {
      store.close();
  }
}
