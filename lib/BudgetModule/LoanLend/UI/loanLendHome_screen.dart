import 'package:budgetlab/BudgetModule/LoanLend/UI/scrollableLoanLendTransactions.dart';
import 'package:budgetlab/Shared/color_manager.dart';
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
          title: const Text(ConstantsManager.LOAN_LEND),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 4, 16),
                    child:
                        WidgetManager.getTwinBanners("Loan", "10,500", ColorManager.LIGHT_RED, 100, MediaQuery.of(context).size.width * 0.45)),
                Padding(
                    padding: const EdgeInsets.fromLTRB(4, 16, 0, 16),
                    child:
                        WidgetManager.getTwinBanners("Lend", "10,700", ColorManager.LIGHT_PURPLE, 100, MediaQuery.of(context).size.width * 0.45)),
              ],
            ),
            WidgetManager.getHeaderDividerSizedBox(
                ConstantsManager.TRANSACTIONS),

            getScrollableLoanLendTransactions(),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 12, 12),
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
