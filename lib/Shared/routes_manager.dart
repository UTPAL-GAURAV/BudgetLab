import 'package:budgetlab/BudgetModule/IncomeExpense/UI/addIncomeExpense_screen.dart';
import 'package:budgetlab/BudgetModule/History/UI/history_screen.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:flutter/widgets.dart';

import '../BudgetModule/LoanLend/UI/addLoanLend_screen.dart';
import '../BudgetModule/LoanLend/UI/loanLendHome_screen.dart';
import '../BudgetModule/Savings/UI/addSavings_screen.dart';
import '../BudgetModule/Savings/UI/savingsHome_screen.dart';
import '../SettingsModule/UI/settings_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/settings': (BuildContext context) => const SettingsScreen(),
  '/home': (BuildContext context) => const HomePageScreen(),
  '/loanLend': (BuildContext context) => const LoanLendHomeScreen(),
  '/addLoanLend': (BuildContext context) => const AddLoanLendScreen(),
  '/incomeExpense': (BuildContext context) => const AddIncomeExpenseScreen(),
  '/addIncomeExpense': (BuildContext context) => const AddIncomeExpenseScreen(),
  '/history': (BuildContext context) => const HistoryScreen(),
  '/savings': (BuildContext context) => const SavingsHomeScreen(),
  '/addSavings': (BuildContext context) => const AddSavingsScreen(),
  // add more routes as needed
};

enum RoutesIndex {
  HOME,
  INCOME_EXPENSE,
  HISTORY,
  SETTINGS,
}

extension RoutesIndexValues on RoutesIndex {
  int get value {
    switch (this) {
      case RoutesIndex.HOME:
        return 0;
      case RoutesIndex.INCOME_EXPENSE:
        return 2;
      case RoutesIndex.HISTORY:
        return 3;
      case RoutesIndex.SETTINGS:
        return 4;
    }
  }
}

// extension RoutesIndexPath on RoutesIndex {
//   String get value {
//     switch(this) {
//       case RoutesIndex.HOME:
//         return '/home';
//       case RoutesIndex.INCOME_EXPENSE:
//         return '/incomeExpense';
//       case RoutesIndex.HISTORY:
//         return '';
//       case RoutesIndex.SETTINGS:
//         return '/settings';
//     }
//   }
// }

class RoutesManager {
  static int currentBottomNavigationBarIndex = 0;
}
