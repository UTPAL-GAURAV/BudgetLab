import 'package:budgetlab/BudgetModule/Savings/UI/scrollableSavings_screen.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:go_router/go_router.dart';

import '../../../HomeModule/UI/homePage_screen.dart';
import '../../../Shared/color_manager.dart';
import '../../../Shared/routes_manager.dart';

class SavingsHomeScreen extends StatefulWidget {
  const SavingsHomeScreen({Key? key}) : super(key: key);

  @override
  State<SavingsHomeScreen> createState() => _SavingsHomeScreenState();
}

class _SavingsHomeScreenState extends State<SavingsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstantsManager.SAVINGS),
        backgroundColor: ColorManager.PRIMARY_BLUE,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRouteConstants.addSavings);
              // Navigator.push(
              //     context, MaterialPageRoute(builder: routes['/category']!));
            },
          ),
        ],
      ),
      body: Container(
        color: ColorManager.PRIMARY_BACKGROUND,
        width: MediaQuery.of(context).size.width,
        height: screenHeight(1.0, context) - AppBar().preferredSize.height,
        child: Padding(
            padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.01, context),
                screenWidth(0.02, context), screenHeight(0.01, context)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: getScrollableSavings(),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
