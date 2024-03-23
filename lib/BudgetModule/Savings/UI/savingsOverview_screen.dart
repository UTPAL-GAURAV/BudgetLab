import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/UI/savingsHistory.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Shared/color_manager.dart';
import 'savingsEdit.dart';
import '../Savings_SavingsTransactions/UI/addSavingsTransaction.dart';

class SavingsOverviewScreen extends StatefulWidget {
  final Savings savings;
  const SavingsOverviewScreen({Key? key, required this.savings}) : super(key: key);

  @override
  State<SavingsOverviewScreen> createState() => _SavingsOverviewScreenState();
}

class _SavingsOverviewScreenState extends State<SavingsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.PRIMARY_BACKGROUND,
          appBar: AppBar(
            backgroundColor: ColorManager.PRIMARY_BLUE,
            foregroundColor: Colors.white,
            title: Text("${widget.savings.title}"),
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: ColorManager.LIGHT_GREY2,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.add),
                  child: Text(
                    "Add to savings",
                    // style: TextStyle(
                    //   fontSize: 20,
                    // ),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.history),
                  text: "History",
                ),
                Tab(
                  icon: Icon(Icons.edit),
                  text: "Edit",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AddSavingsTransaction(
                savings: widget.savings,
              ),
              getSavingsHistory(widget.savings),
              SavingsEdit(savings: widget.savings),
            ],
          ),
        ),
      ),
    );
  }
}
