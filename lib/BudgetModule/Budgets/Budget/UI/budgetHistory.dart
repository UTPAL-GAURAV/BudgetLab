import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/BudgetModule/History/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/color_manager.dart';
import '../../../../Shared/constants_manager.dart';
import '../../../../Shared/service/providers/historyScrollable_provider.dart';
import '../../../../Shared/widgets/widget_manager.dart';
import '../../../History/history_entity.dart';

/// Public Method //////////////////////////////////////////////////////////////
getBudgetHistory(Category category) {
  return BudgetHistory(category: category);
}

/// Widget /////////////////////////////////////////////////////////////////////

class BudgetHistory extends StatefulWidget {
  final Category category;
  const BudgetHistory({Key? key, required this.category}) : super(key: key);

  @override
  State<BudgetHistory> createState() => _BudgetHistoryState();
}

class _BudgetHistoryState extends State<BudgetHistory> {
  HistoryController historyController = HistoryController();
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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HistoryScrollableDateProvider()),
        ],
        child: Consumer<HistoryScrollableDateProvider>(
            builder: (context, provider, child) {
              historyList = historyController.getHistoryListByCategory(widget.category.name);
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: historyList.length,
                  itemBuilder: (context, index) {
                    String photo = historyList[index].photos.length > 0? historyList[index].photos.first: "";
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
                            // Display uploaded image, if not available then category image
                            child: getImageToDisplay(photo.isNotEmpty? photo : widget.category.icon,
                                ConstantsManager.EXPENSE_IMAGE, 0.1, 0.1, context)),
                          title: Text(historyList[index].name, style: TextStyle(
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
      ),
    );
  }
}
