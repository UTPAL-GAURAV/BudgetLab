import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_controller.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_controller.dart';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_controller.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../savings_entity.dart';

/// Public Method //////////////////////////////////////////////////////////////

getScrollableSavingsTransactions(int savingsId) {
  return ScrollableSavingsTransactions(savingsId: savingsId);
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableSavingsTransactions extends StatefulWidget {
  late int savingsId;
  ScrollableSavingsTransactions({Key? key, required this.savingsId}) : super(key: key) {
    this.savingsId = savingsId;
  }

  @override
  State<ScrollableSavingsTransactions> createState() =>
      _ScrollableSavingsTransactionsState();
}

class _ScrollableSavingsTransactionsState extends State<ScrollableSavingsTransactions> {
  late List<SavingsTransactions> savingTransactionsList;

  SavingsTransactionsController savingsTransactionsController = SavingsTransactionsController();
  @override
  void initState() {
    savingTransactionsList = savingsTransactionsController.getAllSavingsTransactionsList(widget.savingsId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: savingTransactionsList.length,
      itemBuilder: (context, index) {
        final SavingsTransactions savingsTransactions = savingTransactionsList[index];
        return SizedBox(
          height: 70, // Height of each tile
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  16), // adjust the radius of shadow
            ),
            child: ListTile(
              tileColor: ColorManager.VISTA_WHITE,
              leading: Text(
                "Rs.${savingsTransactions.amount}",
                style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.018, context)),
              ),
              title: Expanded(
                flex: 2,
                child: Text(savingsTransactions.notes),
              ),
              trailing: Text(
                DateFormat('dd-MM-yyyy').format(savingsTransactions.dateTime),
                style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.018, context)),
              ),
            ),
          ),
        );
      },
    );
  }
}
