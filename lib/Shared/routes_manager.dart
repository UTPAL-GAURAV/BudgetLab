
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