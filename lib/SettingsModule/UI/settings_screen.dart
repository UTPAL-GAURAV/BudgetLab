import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:budgetlab/Shared/widget_manager.dart' as WidgetManager;

import '../../Shared/constants_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstantsManager.APP_NAME),
      ),
      body: Row(
        children: [
          WidgetManager.getHeaderDividerSizedBox(ConstantsManager.CONTENT),
        ],
      ),
      bottomNavigationBar: WidgetManager.getBottomNavigationBar(),
    );
  }
}
