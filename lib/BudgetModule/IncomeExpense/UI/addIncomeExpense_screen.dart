import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_controller.dart';
import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_entity.dart';
import 'package:budgetlab/Shared/model/TextFormFieldConfig.dart';
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
  late String amount, note, category = 'Shopping';
  DateTime date = DateTime.now();

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
              WidgetManager.getTextFormField(TextFormFieldConfig(
                  labelText: "Amount",
                  hintText: " 0",
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  validatorCallback: Validator.validateLendExpenseField,
                  onSavedCallback: (value) => amount = value!)),
              WidgetManager.getTextFormField(TextFormFieldConfig(
                  labelText: "Notes",
                  hintText: " For tuition fees",
                  keyboardType: TextInputType.name,
                  maxLength: 100,
                  validatorCallback: Validator.validateNothing,
                  onSavedCallback: (value) => note = value!)
              ),
              // getHorizontalScrollCategory(),
              Calendar.getCalendar((value) => date = value),
              TextButton(
                  child: const Text(ConstantsManager.SAVE),
                  onPressed: () {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate()) {
                      incomeExpenseController.addIncomeExpense(IncomeExpense(
                          isIncome: true,
                          dateTime: date,
                          amount: int.parse(amount),
                          note: note,
                          category: category),
                      );
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
