import 'package:budgetlab/BudgetModule/Budgets/Budget/budget_entity.dart';
import 'package:budgetlab/BudgetModule/IncomeExpense/UI/addIncomeExpenseAI_screen.dart';
import 'package:budgetlab/BudgetModule/History/UI/historyHome_screen.dart';
import 'package:budgetlab/BudgetModule/Savings/UI/savingsEdit.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:budgetlab/FairShareModule/UI/addFairShareGroupTransaction_screen.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:budgetlab/SettingsModule/UI/introQuestionare_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../BudgetModule/Budgets/Budget/UI/addIncomeExpense_screen.dart';
import '../BudgetModule/Budgets/Budget/UI/budgetOverview_screen.dart';
import '../BudgetModule/Budgets/Budget/UI/budgetHome_screen.dart';
import '../BudgetModule/Budgets/Category/UI/category_screen.dart';
import '../BudgetModule/Budgets/Category/category_entity.dart';
import '../BudgetModule/Savings/Savings_SavingsTransactions/UI/addSavingsTransaction.dart';
import '../BudgetModule/Savings/UI/createSavings_screen.dart';
import '../BudgetModule/Savings/UI/savingsHome_screen.dart';
import '../BudgetModule/Savings/UI/savingsOverview_screen.dart';
import '../FairShareModule/FairShare_Entities/group_entity.dart';
import '../FairShareModule/UI/createFairShareGroup_screen.dart';
import '../FairShareModule/UI/fairShareAddPeopleToGroup_screen.dart';
import '../FairShareModule/UI/fairShareGroupSettings_screen.dart';
import '../FairShareModule/UI/fairShareHome_screen.dart';
import '../FairShareModule/UI/fairShareGroup_screen.dart';
import '../FairShareModule/UI/addFairShareIndividualTransaction_screen.dart';
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
  static const String addIncomeExpenseAI = 'addIncomeExpenseAI';
  static const String addFairShare = 'addFairShare';
  static const String addFairShareTransaction = 'addFairShareTransaction';
  static const String addSavings = 'addSavings';
  static const String addSavingsTransaction = 'addSavingsTransaction';
  static const String budget = 'budget';
  static const String budgetOverview = 'budgetOverview';
  static const String category = 'category';
  static const String createFairShareGroup = 'createFairShareGroup';
  static const String fairShare = 'fairShare';
  static const String fairShareAddPeopleToGroup = 'fairShareAddPeopleToGroup';
  static const String fairShareGroupSettings = 'fairShareGroupSettings';
  static const String groupScreen = 'groupScreen';
  static const String history = 'history';
  static const String introQuestionnaire = 'introQuestionnaire';
  static const String savings = 'savings';
  static const String savingsOverview = 'savingsOverview';
  static const String selectFairShareIndividual = 'selectFairShareIndividual';
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
        name: AppRouteConstants.addFairShareTransaction,
        path: '/addFairShareTransaction',
        pageBuilder: (context, state) {
          final group = state.extra as Group;
          return MaterialPage(child: AddFairShareGroupTransactionScreen(group: group));
        }),
    GoRoute(
        name: AppRouteConstants.addIncomeExpense,
        path: '/addIncomeExpense',
        pageBuilder: (context, state) {
          final category = state.extra as Category;
          return MaterialPage(child: AddIncomeExpenseScreen(category: category));
        }),
    GoRoute(
        name: AppRouteConstants.addIncomeExpenseAI,
        path: '/addIncomeExpenseAI',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddIncomeExpenseScreenAI());
        }),
    GoRoute(
        name: AppRouteConstants.addSavings,
        path: '/addSavings',
        pageBuilder: (context, state) {
          return const MaterialPage(child: CreateSavingsScreen());
        }),
    GoRoute(
        name: AppRouteConstants.addSavingsTransaction,
        path: '/addSavingsTransaction',
        pageBuilder: (context, state) {
          final savings = state.extra as Savings;
          return MaterialPage(child: AddSavingsTransaction(savings: savings));
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
        name: AppRouteConstants.introQuestionnaire,
        path: '/introQuestionnaire',
        pageBuilder: (context, state) {
          return const MaterialPage(child: IntroQuestionareScreen());
        }),
    GoRoute(
        name: AppRouteConstants.fairShare,
        path: '/fairShare',
        pageBuilder: (context, state) {
          return const MaterialPage(child: FairShareHomeScreen());
        }),
    GoRoute(
        name: AppRouteConstants.fairShareAddPeopleToGroup,
        path: '/fairShareAddPeopleToGroup',
        pageBuilder: (context, state) {
          return const MaterialPage(child: FairShareAddPeopleToGroupScreen());
        }),
    GoRoute(
        name: AppRouteConstants.groupScreen,
        path: '/groupScreen',
        pageBuilder: (context, state) {
          final group = state.extra as Group;
          return MaterialPage(child: FairShareGroupScreen(group: group));
        }),
    GoRoute(
        name: AppRouteConstants.fairShareGroupSettings,
        path: '/fairShareGroupSettings',
        pageBuilder: (context, state) {
          final group = state.extra as Group;
          return MaterialPage(child: FairShareGroupSettings(group: group));
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
        name: AppRouteConstants.selectFairShareIndividual,
        path: '/selectFairShareIndividual',
        pageBuilder: (context, state) {
          return MaterialPage(child: AddFairShareIndividualTransactionScreen());
        }),
    GoRoute(
        name: AppRouteConstants.settings,
        path: '/settings',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SettingsScreen());
        }),
  ]);
}
