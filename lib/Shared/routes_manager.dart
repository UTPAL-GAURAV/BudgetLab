
import 'package:budgetlab/BudgetModule/LoanLend/UI/loanLend_screen.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:flutter/widgets.dart';

import '../SettingsModule/UI/settings_screen.dart';


final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/settings': (BuildContext context) => const SettingsScreen(),
  '/home': (BuildContext context) => const HomePageScreen(),
  '/loanLend': (BuildContext context) => const LoanLendScreen(),
  // add more routes as needed
};