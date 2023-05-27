import 'package:budgetlab/BudgetModule/LoanLend/UI/scrollableLoanLendTransactions.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:budgetlab/Shared/routes_manager.dart';
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        WidgetManager.getBanners("Loan", "10", "blue", 70, 70)),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        WidgetManager.getBanners("Lend", "10", "blue", 70, 70)),
              ],
            ),
            WidgetManager.getHeaderDividerSizedBox(
                ConstantsManager.TRANSACTIONS),
            getScrollableLoanLendTransactions(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.extended(
                      label: const Text("Lend/Borrow"),
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: routes['/addLoanLend']!));
                      })),
            )
          ],
        ));
  }
}
