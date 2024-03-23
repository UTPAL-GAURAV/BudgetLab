import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/History/history_controller.dart';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/color_manager.dart';
import '../../../../Shared/constants_manager.dart';
import '../../../../Shared/service/providers/historyScrollable_provider.dart';
import '../../../../Shared/widgets/widget_manager.dart';
import '../../../History/history_entity.dart';
import '../../savings_entity.dart';
import '../savingsTransactions_entity.dart';

/// Public Method //////////////////////////////////////////////////////////////
getSavingsHistory(Savings savings) {
  return SavingsHistory(savings: savings);
}

/// Widget /////////////////////////////////////////////////////////////////////

class SavingsHistory extends StatefulWidget {
  final Savings savings;
  const SavingsHistory({Key? key, required this.savings}) : super(key: key);

  @override
  State<SavingsHistory> createState() => _SavingsHistoryState();
}

class _SavingsHistoryState extends State<SavingsHistory> {
  SavingsTransactionsController savingsTransactionsController = SavingsTransactionsController();

  @override
  Widget build(BuildContext context) {
    String currencySymbol =
        ConstantsManager.currencies.firstWhere((currency) => currency['currencyCode'] == 'USD')['symbol'] ?? '';
    return Container(
      color: ColorManager.PRIMARY_BACKGROUND,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.63,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HistoryScrollableDateProvider()),
        ],
        child: Consumer<HistoryScrollableDateProvider>(builder: (context, provider, child) {
          List<SavingsTransactions> savingsTransactionsList =
              savingsTransactionsController.getAllSavingsTransactionsList(widget.savings.id);
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: savingsTransactionsList.length,
              itemBuilder: (context, index) {
                String weekdayName =
                    ConstantsManager.weekday[savingsTransactionsList[index].dateTime.weekday].toString();
                String monthNameAbbreviation =
                    ConstantsManager.months[savingsTransactionsList[index].dateTime.month].toString().substring(0, 3);
                String displayDate =
                    "$weekdayName, ${savingsTransactionsList[index].dateTime.day} $monthNameAbbreviation";

                return Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), 0, screenWidth(0.02, context), 0),
                  child: Column(children: [
                    ListTile(
                      title: Text(
                        currencySymbol + savingsTransactionsList[index].amount.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.INCOME_GREEN,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.fromLTRB(0, screenHeight(0.01, context), 0, 0),
                        child: Text(
                          displayDate,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                      trailing: Text(
                        savingsTransactionsList[index].notes,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.BLACK_VOID,
                        ),
                      ),
                    ),
                    Divider(
                      color: ColorManager.LIGHT_GREY, // Color of the line
                      thickness: 2.4, // Thickness of the line
                    )
                  ]),
                );
              });
        }),
      ),
    );
  }
}
