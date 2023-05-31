import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_controller.dart';
import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_entity.dart';
import 'package:budgetlab/SettingsModule/metadata_controller.dart';
import 'package:budgetlab/Shared/model/TextFormFieldConfig.dart';
import 'package:budgetlab/BudgetModule/IncomeExpense/UI/scrollableIncomeExpenseCategory.dart';
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
  bool isIncome = false;

  IncomeExpenseController incomeExpenseController = IncomeExpenseController();
  MetaDataController metaDataController = MetaDataController();

  @override
  void initState() {
    RoutesManager.currentBottomNavigationBarIndex = 2;
    super.initState();
  }

  @override
  void dispose() {
    RoutesManager.currentBottomNavigationBarIndex = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(ConstantsManager.ADD_INCOME_EXPENSE),
        ),
        body: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: [
              getToggleButtons(
                  ["Expense", "Income"], ((value) => isIncome = value == 1)),
              WidgetManager.getTextFormField(TextFormFieldConfig(
                  labelText: "Amount",
                  hintText: " 0",
                  keyboardType: TextInputType.number,
                  maxLength: 8,
                  validatorCallback: Validator.validateLendExpenseField,
                  onSavedCallback: (value) => amount = value!)),
              WidgetManager.getTextFormField(TextFormFieldConfig(
                  labelText: "Notes",
                  hintText: " Tuition fees",
                  keyboardType: TextInputType.name,
                  maxLength: 100,
                  validatorCallback: Validator.validateNothing,
                  onSavedCallback: (value) => note = value!)),
              const Text("Category"),
              SizedBox(
                height: 100,
                child: getScrollableIncomeExpenseCategory(),
              ),
              Calendar.getCalendar((value) => date = value),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: FloatingActionButton.extended(
                      label: const Text("Save"),
                      onPressed: () {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          incomeExpenseController.addIncomeExpense(
                            IncomeExpense(
                                isIncome: isIncome,
                                dateTime: date,
                                amount: int.parse(amount),
                                note: note,
                                category: category),
                          );
                          metaDataController.updateCurrentBalance(isIncome, int.parse(amount));
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: routes['/home']!));
                        }
                      }),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
