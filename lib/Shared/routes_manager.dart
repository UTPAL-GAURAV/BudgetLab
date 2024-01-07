import 'package:budgetlab/BudgetModule/IncomeExpense/UI/addIncomeExpense_screen.dart';
import 'package:budgetlab/BudgetModule/History/UI/history_screen.dart';
import 'package:budgetlab/BudgetModule/Savings/UI/savingsOverview_screen.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../BudgetModule/Budgets/Budget/UI/budgetOverview_screen.dart';
import '../BudgetModule/Budgets/Budget/UI/budgetHome_screen.dart';
import '../BudgetModule/Budgets/Category/UI/category_screen.dart';
import '../BudgetModule/Budgets/Category/category_entity.dart';
import '../BudgetModule/Savings/Savings_SavingsTransactions/UI/addSavingsTransaction_screen.dart';
import '../BudgetModule/Savings/UI/addSavings_screen.dart';
import '../BudgetModule/Savings/UI/savingsHome_screen.dart';
import '../FairShareModule/UI/createGroup_screen.dart';
import '../FairShareModule/UI/fairShareHome_screen.dart';
import '../SettingsModule/UI/settings_screen.dart';
import '../main.dart';
import 'constants_manager.dart';


enum BottomNavigationBarEnum {
  HOME,
  INCOME_EXPENSE,
  HISTORY,
  SETTINGS,
}

extension BottomNavigationBarRoutesIndexValues on BottomNavigationBarEnum {
  int get value {
    switch (this) {
      case BottomNavigationBarEnum.HOME:
        return 0;
      case BottomNavigationBarEnum.INCOME_EXPENSE:
        return 2;
      case BottomNavigationBarEnum.HISTORY:
        return 3;
      case BottomNavigationBarEnum.SETTINGS:
        return 4;
    }
  }
}

class AppRouteConstants {
  static const String home = 'home';
  static const String addIncomeExpense = 'addIncomeExpense';
  static const String addFairShare = 'addFairShare';
  static const String addSavings = 'addSavings';
  static const String addSavingsTransaction = 'addSavingsTransaction';
  static const String budget = 'budget';
  static const String budgetOverview = 'budgetOverview';
  static const String category = 'category';
  static const String createFairShareGroup = 'createFairShareGroup';
  static const String fairShare = 'fairShare';
  static const String history = 'history';
  static const String incomeExpense = 'incomeExpense';
  static const String savings = 'savings';
  static const String savingsOverview = 'savingsOverview';
  static const String settings = 'settings';
}

class RoutesManager {

  static GoRouter goRouter = GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
    GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: MyHomePage(title: ConstantsManager.APP_NAME));
        }),
    GoRoute(
        name: AppRouteConstants.home,
        path: '/home',
        pageBuilder: (context, state) {
          return MaterialPage(child: HomePageScreen());
        }),
    GoRoute(
        name: AppRouteConstants.addIncomeExpense,
        path: '/addIncomeExpense',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddIncomeExpenseScreen());
        }),
    // GoRoute(
    //     name: AppRouteConstants.addFairShare,
    //     path: '/addFairShare',
    //     pageBuilder: (context, state) {
    //       return const MaterialPage(child: AddLoanLendScreen());
    //     }),
    GoRoute(
        name: AppRouteConstants.addSavings,
        path: '/addSavings',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddSavingsScreen());
        }),
    GoRoute(
        name: AppRouteConstants.addSavingsTransaction,
        path: '/addSavingsTransaction',
        pageBuilder: (context, state) {
          final savings = state.extra as Savings;
          return MaterialPage(child: AddSavingsTransactionScreen(savings: savings));
        }),
    GoRoute(
        name: AppRouteConstants.budget,
        path: '/budget',
        pageBuilder: (context, state) {
          return const MaterialPage(child: BudgetScreen());
        }),
    GoRoute(
        name: AppRouteConstants.budgetOverview,
        path: '/budgetOverview',
        pageBuilder: (context, state) {
          final category = state.extra as Category;
          return MaterialPage(child: BudgetOverviewScreen(category: category));
        }),
    GoRoute(
        name: AppRouteConstants.category,
        path: '/category',
        pageBuilder: (context, state) {
          return MaterialPage(child: CategoryScreen());
        }),
    GoRoute(
        name: AppRouteConstants.createFairShareGroup,
        path: '/createFairShareGroup',
        pageBuilder: (context, state) {
          return const MaterialPage(child: CreateFairShareGroupScreen());
        }),
    GoRoute(
        name: AppRouteConstants.history,
        path: '/history',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HistoryScreen());
        }),
    GoRoute(
        name: AppRouteConstants.incomeExpense,
        path: '/incomeExpense',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddIncomeExpenseScreen());
        }),
    GoRoute(
        name: AppRouteConstants.fairShare,
        path: '/fairShare',
        pageBuilder: (context, state) {
          return const MaterialPage(child: FairShareHomeScreen());
        }),
    GoRoute(
        name: AppRouteConstants.savings,
        path: '/savings',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SavingsHomeScreen());
        }),
    GoRoute(
        name: AppRouteConstants.savingsOverview,
        path: '/savingsOverview',
        pageBuilder: (context, state) {
          final savings = state.extra as Savings;
          return MaterialPage(child: SavingsOverviewScreen(savings: savings));
        }),
    GoRoute(
        name: AppRouteConstants.settings,
        path: '/settings',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SettingsScreen());
        }),
  ]);
}
