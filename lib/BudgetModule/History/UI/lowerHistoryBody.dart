import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:budgetlab/Shared/service/providers/historyScrollable_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../Shared/color_manager.dart';
import '../../../Shared/constants_manager.dart';
import 'history_screen.dart';

/// Public Method //////////////////////////////////////////////////////////////
getLowerHistoryBody() {
  return LowerHistoryBody();
}

/// Widget /////////////////////////////////////////////////////////////////////
class LowerHistoryBody extends StatefulWidget {
  const LowerHistoryBody({Key? key}) : super(key: key);

  @override
  State<LowerHistoryBody> createState() => _LowerHistoryBodyState();
}

class _LowerHistoryBodyState extends State<LowerHistoryBody> {
  List<History> historyList = [];

  @override
  Widget build(BuildContext context) {
    String currencySymbol = ConstantsManager.currencies.firstWhere(
            (currency) => currency['currencyCode'] == 'USD')['symbol'] ??
        '';
    return Container(
      color: ColorManager.PRIMARY_BACKGROUND,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.63,
      child: Consumer<HistoryScrollableDateProvider>(
          builder: (context, provider, child) {
        historyList = historyService.getCustomHistoryList(provider.selectedYear,
            provider.selectedMonth, provider.selectedDate);
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: historyList.length,
            itemBuilder: (context, index) {
              String weekdayName =
                  ConstantsManager.weekday[historyList[index].day].toString();
              String monthNameAbbreviation = ConstantsManager
                  .months[historyList[index].month]
                  .toString()
                  .substring(0, 3);
              String displayDate =
                  "$weekdayName, ${historyList[index].date} $monthNameAbbreviation";
              String transactionSymbol =
                  historyList[index].isIncome ? "" : "- ";

              return Padding(
                padding: EdgeInsets.fromLTRB(
                    screenWidth(0.05, context), 0, screenWidth(0.05, context), 0),
                child: Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.06,
                      backgroundImage: AssetImage(
                          'assets/images/avatars/neutralGreenHair.jpg'),
                    ),
                    title: Text(historyList[index].title, style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.BLACK_VOID
                    ),),
                    subtitle: Padding(
                      padding: EdgeInsets.fromLTRB(0,screenHeight(0.01, context),0,0),
                      child: Text(displayDate, style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                    trailing: Text(
                      transactionSymbol +
                          currencySymbol +
                          historyList[index].amount.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: historyList[index].isIncome
                            ? ColorManager.INCOME_GREEN
                            : ColorManager.EXPENSE_RED,
                      ),
                    ),
                  ),
                  Divider(
                    color: ColorManager.LIGHT_GREY, // Color of the line
                    thickness: 2.4,     // Thickness of the line
                  )
                ]),
              );
            });
      }),
    );
  }
}
