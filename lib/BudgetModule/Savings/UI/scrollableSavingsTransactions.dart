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
        return Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.50),
            child: Container(
              child: ListView.builder(
                itemCount: savingListLength,
                itemBuilder: (context, index) {
                  final savings = savingsList[index];
                  return SizedBox(
                    height: 70, // Height of each tile
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            16), // adjust the radius of shadow
                      ),
                      child: ListTile(
                        tileColor: ColorManager.VISTA_WHITE,
                        leading: ClipOval(
                          child: SizedBox(
                              height: 60,
                              width: 55,
                              child: Image.asset(
                                savings.icon,
                                fit: BoxFit.fill,
                              )),
                        ),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(savings.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+ " + savings.targetAmount.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: ColorManager.CLOVER_GREEN,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
