import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_controller.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Public Method //////////////////////////////////////////////////////////////

getScrollableLoanLendTransactions() {
  return const ScrollableLoanLendTransactions();
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableLoanLendTransactions extends StatefulWidget {
  const ScrollableLoanLendTransactions({Key? key}) : super(key: key);

  @override
  State<ScrollableLoanLendTransactions> createState() =>
      _ScrollableLoanLendTransactionsState();
}

class _ScrollableLoanLendTransactionsState extends State<ScrollableLoanLendTransactions> {
  int loanLendListLength = 0;
  late ValueNotifier<List<LoanLend>> loanLendList;

  LoanLendController loanLendController = LoanLendController();

  @override
  void initState() {
    super.initState();
    loanLendList = ValueNotifier<List<LoanLend>>([]);
    fetchData();
  }

  void fetchData() async {
    List<LoanLend> fetchedData = await loanLendController.getAllLoanLendList();
    loanLendList.value = fetchedData;
    loanLendListLength = fetchedData.length;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<LoanLend>>(
      valueListenable: loanLendList,
      builder: (context, loanLendList, _) {
        return ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.50),
          child: ListView.builder(
            itemCount: loanLendListLength,
            itemBuilder: (context, index) {
              final loanLend = loanLendList[index];
              return SizedBox(
                height: 70, // Height of each tile
                child: ListTile(
                  tileColor: ColorManager.VISTA_WHITE,
                  leading: SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset(
                        loanLend.genderEmoji,
                        fit: BoxFit.fill,
                      )),
                  title: Row(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(loanLend.name),
                          ),
                          Text("Due date: ${DateFormat('dd-MM-yyyy').format(loanLend.dateOfReturn)}"),
                        ],
                      ),

                      Expanded(
                        flex: 1,
                        child: Text(loanLend.amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: loanLend.isLoan
                                ? ColorManager.CHILLY_PEPPER
                                : ColorManager.CLOVER_GREEN,
                          ),
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
