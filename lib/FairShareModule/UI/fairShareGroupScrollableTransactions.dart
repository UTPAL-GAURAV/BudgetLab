import 'dart:io';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/FairShareModule/FairShare_Entities/group_entity.dart';
import 'package:budgetlab/FairShareModule/FairShare_Entities/transactions_entity.dart';
import 'package:budgetlab/FairShareModule/fairShare_controller.dart';
import 'package:budgetlab/SettingsModule/metadata_controller.dart';
import 'package:budgetlab/SettingsModule/metadata_entity.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/enums_manager.dart';
import 'package:budgetlab/Shared/service/providers/incomeExpense_provider.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../Shared/routes_manager.dart';
import '../../HomeModule/UI/homePage_screen.dart';
import '../../Shared/constants_manager.dart';

/// Public Method //////////////////////////////////////////////////////////////

getFairShareGroupScrollableTransactions(onGroupSelectedCallback) {
  return FairShareGroupScrollableTransactions(onGroupSelected: onGroupSelectedCallback);
}

/// Widget /////////////////////////////////////////////////////////////////////

class FairShareGroupScrollableTransactions extends StatefulWidget {
  final Group onGroupSelected;
  FairShareGroupScrollableTransactions({Key? key, required this.onGroupSelected}) : super(key: key);

  @override
  State<FairShareGroupScrollableTransactions> createState() => _FairShareGroupScrollableTransactionsState();
}

class _FairShareGroupScrollableTransactionsState extends State<FairShareGroupScrollableTransactions> {
  FairShareController fairShareController = FairShareController();
  MetaDataController metaDataController = MetaDataController();

  List<Transactions> allTransactionList = [];
  late String userUniqieId;
  String currencySymbol =
      ConstantsManager.currencies.firstWhere((currency) => currency['currencyCode'] == 'USD')['symbol'] ?? '';

  @override
  void initState() {
    allTransactionList = fairShareController.getAllGroupTransactions();
    userUniqieId = metaDataController.getAllMetadata()?.userUniqueId ?? "00000";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: allTransactionList.length,
            itemBuilder: (context, index) {
              String monthNameAbbreviation =
                  ConstantsManager.months[allTransactionList[index].dateTime.month].toString().substring(0, 3);
              String displayDate = allTransactionList[index].dateTime.day.toString();
              String photoPath = allTransactionList[index].photos.isNotEmpty? allTransactionList[index].photos[0]:"";
              bool isLent = allTransactionList[index].friendId == userUniqieId;
              String lentBorrowedText = isLent? "you lent" : "you borrowed";
              String whoPaidText = isLent? "You paid" : "${fairShareController.getFriendNameFromId(allTransactionList[index].friendId)} paid";

              return GestureDetector(
                onTap: () {
                  // GoRouter.of(context).pushNamed(AppRouteConstants.budgetOverview, extra: categoryList[index]);
                },
                child: Container(
                  // margin: EdgeInsets.fromLTRB(0, screenHeight(0.01, context), 0, screenHeight(0.014, context)),
                  padding: EdgeInsets.fromLTRB(screenWidth(0.00, context), screenHeight(0.01, context),
                      screenWidth(0.00, context), screenHeight(0.01, context)),
                  decoration: BoxDecoration(color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.4,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  Text(
                                    monthNameAbbreviation,
                                    style: TextStyle(
                                        color: ColorManager.BLACK_VOID,
                                        fontSize: screenHeight(0.022, context),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    displayDate,
                                    style: TextStyle(
                                        color: ColorManager.BLACK_VOID,
                                        fontSize: screenHeight(0.022, context),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: getImageToDisplay(photoPath, ConstantsManager.EXPENSE_IMAGE, 0.1, 0.1, context),
                          ),

                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16, right: 8),
                              child: Column(
                                children: [
                                  Text(
                                    allTransactionList[index].name,
                                    style: TextStyle(
                                        color: ColorManager.BLACK_VOID,
                                        fontSize: screenHeight(0.016, context),
                                        fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "$whoPaidText $currencySymbol ${allTransactionList[index].amount.toString()}",
                                    style: TextStyle(
                                        color: ColorManager.DARK_GREY,
                                        fontSize: screenHeight(0.016, context),
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  lentBorrowedText,
                                  style: TextStyle(
                                      color: isLent? ColorManager.CLOVER_GREEN : ColorManager.HOT_CORAL,
                                      fontSize: screenHeight(0.016, context),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "$currencySymbol ${allTransactionList[index].amount.toString()}",
                                  style: TextStyle(
                                      color: isLent? ColorManager.CLOVER_GREEN : ColorManager.HOT_CORAL,
                                      fontSize: screenHeight(0.016, context),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
        SizedBox(height: screenHeight(0.08, context)),
      ],
    );
  }
}
