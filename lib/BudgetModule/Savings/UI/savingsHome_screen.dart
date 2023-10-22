import 'package:budgetlab/BudgetModule/Savings/UI/scrollableSavingsTransactions.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:go_router/go_router.dart';

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
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 4, 16),
              child:
              WidgetManager.getSingleBanner("SAVINGS", "10,500", ColorManager.LIGHT_GREEN, 100, MediaQuery.of(context).size.width * 0.45)),

          // Text(
          //   " Total Savings : 20,000",
          //   style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
          // ),
          WidgetManager.getHeaderDividerSizedBox(ConstantsManager.TRANSACTIONS),
          getScrollableSavingsTransactions(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton.extended(
                    label: const Text("Savings"),
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      GoRouter.of(context).pushNamed(AppRouteConstants.addSavings);
                    })),
          )
        ],
      ),
    );
  }
}
