import 'package:budgetlab/BudgetModule/IncomeExpense/UI/addIncomeExpense_screen.dart';
import 'package:budgetlab/BudgetModule/History/UI/history_screen.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../BudgetModule/Budgets/Budget/UI/budgetOverview_screen.dart';
import '../BudgetModule/Budgets/Budget/UI/budget_screen.dart';
import '../BudgetModule/Budgets/Category/UI/category_screen.dart';
import '../BudgetModule/Budgets/Category/category_entity.dart';
import '../BudgetModule/LoanLend/UI/addLoanLend_screen.dart';
import '../BudgetModule/LoanLend/UI/loanLendHome_screen.dart';
import '../BudgetModule/Savings/UI/addSavings_screen.dart';
import '../BudgetModule/Savings/UI/savingsHome_screen.dart';
import '../SettingsModule/UI/settings_screen.dart';
import '../main.dart';
import 'constants_manager.dart';

/// Kept specially for bottom navigation bar
final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/settings': (BuildContext context) => const SettingsScreen(),
  '/home': (BuildContext context) => const HomePageScreen(),
  // '/loanLend': (BuildContext context) => const LoanLendHomeScreen(),
  '/addLoanLend': (BuildContext context) => const AddLoanLendScreen(),
  // '/incomeExpense': (BuildContext context) => const AddIncomeExpenseScreen(),
  '/addIncomeExpense': (BuildContext context) => const AddIncomeExpenseScreen(),
  // '/category': (BuildContext context) => const CategoryScreen(showDeleteButton: false),
  '/history': (BuildContext context) => const HistoryScreen(),
  // '/budget': (BuildContext context) => const BudgetScreen(),
  // '/savings': (BuildContext context) => const SavingsHomeScreen(),
  // '/addSavings': (BuildContext context) => const AddSavingsScreen(),
  // '/budgetOverview': (BuildContext context) => BudgetOverviewScreen(category : null),
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

  static GoRouter goRouter = GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
    GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: MyHomePage(title: ConstantsManager.APP_NAME));
        }),
    GoRoute(
        name: 'home',
        path: '/home',
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePageScreen());
        }),
    GoRoute(
        name: 'addIncomeExpense',
        path: '/addIncomeExpense',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddIncomeExpenseScreen());
        }),
    GoRoute(
        name: 'addLoanLend',
        path: '/addLoanLend',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddLoanLendScreen());
        }),
    GoRoute(
        name: 'addSavings',
        path: '/addSavings',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddSavingsScreen());
        }),
    GoRoute(
        name: 'budget',
        path: '/budget',
        pageBuilder: (context, state) {
          return const MaterialPage(child: BudgetScreen());
        }),
    GoRoute(
        name: 'category',
        path: '/category',
        pageBuilder: (context, state) {
          return const MaterialPage(child: CategoryScreen(showDeleteButton: false));
        }),
    GoRoute(
        name: 'history',
        path: '/history',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HistoryScreen());
        }),
    GoRoute(
        name: 'incomeExpense',
        path: '/incomeExpense',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddIncomeExpenseScreen());
        }),
    GoRoute(
        name: 'loanLend',
        path: '/loanLend',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoanLendHomeScreen());
        }),
    GoRoute(
        name: 'savings',
        path: '/savings',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SavingsHomeScreen());
        }),
    GoRoute(
        name: 'settings',
        path: '/settings',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SettingsScreen());
        }),
  ]);
}
