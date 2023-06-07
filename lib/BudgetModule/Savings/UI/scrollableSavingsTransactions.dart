import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_controller.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_controller.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../saings_entity.dart';

/// Public Method //////////////////////////////////////////////////////////////

getScrollableSavingsTransactions() {
  return const ScrollableSavingsTransactions();
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableSavingsTransactions extends StatefulWidget {
  const ScrollableSavingsTransactions({Key? key}) : super(key: key);

  @override
  State<ScrollableSavingsTransactions> createState() =>
      _ScrollableSavingsTransactionsState();
}

class _ScrollableSavingsTransactionsState
    extends State<ScrollableSavingsTransactions> {
  int savingListLength = 0;
  late ValueNotifier<List<Savings>> savingsList;

  SavingsController savingsController = SavingsController();
  @override
  void initState() {
    super.initState();
    savingsList = ValueNotifier<List<Savings>>([]);
    fetchData();
  }

  void fetchData() async {
    List<Savings> fetchedData = await savingsController.getAllSavingsList();
    savingsList.value = fetchedData;
    savingListLength = fetchedData.length;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Savings>>(
      valueListenable: savingsList,
      builder: (context, savingsList, _) {
        return ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.50),
          child: ListView.builder(
            itemCount: savingListLength,
            itemBuilder: (context, index) {
              final savings = savingsList[index];
              return SizedBox(
                height: 70, // Height of each tile
                child: ListTile(
                  tileColor: ColorManager.VISTA_WHITE,
                  leading: SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset(
                        'assets/images/icons/' + savings.icon + '.png',
                        fit: BoxFit.fill,
                      )),
                  title: Row(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(savings.title),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          savings.targetAmount.toString(),
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // openLoanLendEditPopup(context, index);
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
