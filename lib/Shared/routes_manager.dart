
<<<<<<< Updated upstream
=======
import 'package:budgetlab/BudgetModule/LoanLend/UI/addLoanLend_screen.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
>>>>>>> Stashed changes
import 'package:flutter/widgets.dart';

import '../SettingsModule/UI/settings_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String settingsRoute = "/settings";
  static const String historyRoute = "/history";
}

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/settings': (BuildContext context) => const SettingsScreen(),
  // add more routes as needed
};


enum RoutesIndex {
  HOME,
  LOANLEND,
  SETTINGS,
}

extension RoutesIndexValues on RoutesIndex {
  int get value {
    switch (this) {
      case RoutesIndex.HOME:
        return 0;
      case RoutesIndex.LOANLEND:
        return 4;
      case RoutesIndex.SETTINGS:
        return 3;
    }
  }
}

class RoutesManager {
  static int currentBottomNavigationBarIndex = 0;
}