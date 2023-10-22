import 'package:flutter/material.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/constants_manager.dart';
import '../../../History/history_entity.dart';

/// Public Method //////////////////////////////////////////////////////////////
getBudgetHistory(String categoryName) {
  return BudgetHistory(categoryName: categoryName);
}

/// Widget /////////////////////////////////////////////////////////////////////

class BudgetHistory extends StatefulWidget {
  final String categoryName;
  const BudgetHistory({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<BudgetHistory> createState() => _BudgetHistoryState();
}

class _BudgetHistoryState extends State<BudgetHistory> {
  List<History> historyList = [];

  @override
  Widget build(BuildContext context) {
    String currencySymbol =
        ConstantsManager.currencies.firstWhere((currency) => currency['currencyCode'] == 'USD')['symbol'] ?? '';

    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: historyList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.fromLTRB(screenWidth(0.05, context), 0, screenWidth(0.05, context), 0),
                child: Column(
                  children: [],
                ));
          }),
    );
  }
}
