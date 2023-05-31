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

class _ScrollableLoanLendTransactionsState
    extends State<ScrollableLoanLendTransactions> {
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
        return Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.61),
            child: Container(
              color: ColorManager.LIGHT_GREY2,
              child: ListView.builder(
                itemCount: loanLendListLength,
                itemBuilder: (context, index) {
                  final loanLend = loanLendList[index];
                  return SizedBox(
                    height: 90,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16), // adjust the radius of shadow
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16), // adjust the radius of tile
                        ),
                        tileColor: ColorManager.VISTA_WHITE,
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 26, 10),
                        leading: ClipOval(
                          child: SizedBox(
                              height: 60,
                              width: 55,
                              child: Image.asset(
                                loanLend.genderEmoji,
                                fit: BoxFit.fill,
                              )),
                        ),
                        title: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center, // Centers the Texts vertically
                              crossAxisAlignment : CrossAxisAlignment.start, // Keeps the texts on left
                              children: [
                                Text(loanLend.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                                SizedBox(height: 8,),
                                Text(
                                  "Due date: ${DateFormat('dd-MM-yyyy').format(loanLend.dateOfReturn)}",
                                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              loanLend.amount.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: loanLend.isLoan
                                    ? ColorManager.CHILLY_PEPPER
                                    : ColorManager.CLOVER_GREEN,
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
