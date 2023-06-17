import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_controller.dart';
import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_entity.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:intl/intl.dart';

import '../../../Shared/color_manager.dart';
import '../../../Shared/constants_manager.dart';

class IncomeExpenseDisplay extends StatefulWidget {
  const IncomeExpenseDisplay({Key? key}) : super(key: key);

  @override
  State<IncomeExpenseDisplay> createState() => _IncomeExpenseDisplay();
}

List<IncomeExpense> transactions =  IncomeExpenseController().getAllIncomeExpenseList();


class _IncomeExpenseDisplay extends State<IncomeExpenseDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 4, 16),
                  child:
                  WidgetManager.getSingleBanner("Total Expense", '\$${calculateTotalExpenses(transactions).toStringAsFixed(2)}', Colors.cyanAccent, 100, MediaQuery.of(context).size.width * 0.45)
              ),
              WidgetManager.getHeaderDividerSizedBox(ConstantsManager.TRANSACTIONS),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: IncomeExpenseController().getAllIncomeExpenseList().length,
              itemBuilder: (context, index) {
                String category = transactions[index].isIncome ? "Income" : "Expense";
                Color fontColor = transactions[index].isIncome ? Colors.green : Colors.red;
                String date = DateFormat('dd-MM-yyyy').format(transactions[index].dateTime);
                return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      onTap: () => print('${transactions[index]}'),
                      leading:  Column(
                        children: [
                          const Icon(Icons.currency_rupee_rounded),
                          const SizedBox(height: 8),
                          Text(date, textAlign: TextAlign.center),
                        ],
                      ),
                      // const Icon(Icons.currency_rupee_rounded),
                      iconColor: fontColor,
                      title: Text(transactions[index].category),
                      subtitle: Text(category),
                      trailing: Text(
                        'Rs. ${transactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: fontColor,
                        ),
                      ),
                    )
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  double calculateTotalExpenses(List<IncomeExpense> transactions) {
    double total = 0.0;
    for (var transaction in transactions) {
      if(!transaction.isIncome) {
        total += transaction.amount;
      }
    }
    return total;
  }

}