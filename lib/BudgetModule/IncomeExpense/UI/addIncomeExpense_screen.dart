import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_controller.dart';
import 'package:budgetlab/Shared/widgets/horizontalScrollCategory.dart';
import 'package:budgetlab/Shared/widgets/toggleButtons.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/widgets/calendar.dart' as Calendar;
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../../../Shared/constants_manager.dart';
import '../../../Shared/routes_manager.dart';

class AddIncomeExpenseScreen extends StatefulWidget {
  const AddIncomeExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddIncomeExpenseScreen> createState() => _AddIncomeExpenseScreenState();
}

class _AddIncomeExpenseScreenState extends State<AddIncomeExpenseScreen> {
  final formKey = GlobalKey<FormState>();
  late String amount, notes, category;
  late DateTime date;

  IncomeExpenseController incomeExpenseController = IncomeExpenseController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(ConstantsManager.APP_NAME),
        ),
        body: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  getToggleButtons(["Income", "Expense"]),
                  WidgetManager.getTextFormField(
                      "Amount",
                      " 0",
                      TextInputType.number,
                      8,
                      Validator.validateLendExpenseField,
                          (value) => amount = value!),
                  WidgetManager.getTextFormField(
                      "Notes",
                      " For tuition fees.",
                      TextInputType.name,
                      100,
                      Validator.validateNothing,
                          (value) => notes = value!),
                  // getHorizontalScrollCategory(),
                  Calendar.getCalendar((value) => date = value),
                  TextButton(
                      child: const Text(ConstantsManager.SAVE),
                      onPressed: () {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          incomeExpenseController.addIncomeExpense(true, date, int.parse(amount), notes, category);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: routes['/home']!));
                        }
                      }),
                ],
              );
            }),
      ),
    );
  }
}
