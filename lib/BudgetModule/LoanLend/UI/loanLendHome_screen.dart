import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;

class LoanLendHomeScreen extends StatefulWidget {
  const LoanLendHomeScreen({Key? key}) : super(key: key);

  @override
  State<LoanLendHomeScreen> createState() => _LoanLendHomeScreenState();
}

class _LoanLendHomeScreenState extends State<LoanLendHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(ConstantsManager.APP_NAME),
        ),
        body: Column(
          children: [
            Row(
              children: [],
            ),
            WidgetManager.getHeaderDividerSizedBox(
                ConstantsManager.TRANSACTIONS),
          ],
        ));
  }
}
