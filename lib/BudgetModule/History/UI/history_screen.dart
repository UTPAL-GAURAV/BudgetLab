import 'package:budgetlab/BudgetModule/History/UI/upperHistoryBody.dart';
import 'package:budgetlab/BudgetModule/History/history_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import '../../../HomeModule/UI/homePage_screen.dart';
import '../../../Shared/color_manager.dart';
import '../../../Shared/constants_manager.dart';
import '../../../Shared/routes_manager.dart';
import 'package:budgetlab/Shared/widgets/bottomNavigationBar.dart' as BottomNavigationBar;

import '../../../Shared/widgets/scrollableDays.dart';

HistoryService historyService = HistoryService();

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    RoutesManager.currentBottomNavigationBarIndex = 3;
    super.initState();
  }

  @override
  void dispose() {
    RoutesManager.currentBottomNavigationBarIndex = 0;
    super.dispose();
  }

  bool isSwitchedHide = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.BACKGROUND_GREY,
      bottomNavigationBar: BottomNavigationBar.getBottomNavigationBar(),
      body: Column(
        children: [
          getUpperHistoryBody(),
        ],
      ),
    );
  }
}

