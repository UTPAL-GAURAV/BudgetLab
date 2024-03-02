import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_controller.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:budgetlab/SettingsModule/metadata_controller.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/enums_manager.dart';
import 'package:budgetlab/Shared/model/TextFormFieldConfig.dart';
import 'package:budgetlab/BudgetModule/IncomeExpense/UI/scrollableIncomeExpenseCategory.dart';
import 'package:budgetlab/Shared/service/providers/incomeExpense_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:budgetlab/Shared/widgets/calendar.dart' as Calendar;
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../Shared/constants_manager.dart';
import '../../../../Shared/routes_manager.dart';
import '../../../../Shared/widgets/widget_manager.dart';
import '../../Category/category_entity.dart';
import '../budget_entity.dart';

class AddIncomeExpenseScreen extends StatefulWidget {
  final Category category;
  const AddIncomeExpenseScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<AddIncomeExpenseScreen> createState() => _AddIncomeExpenseScreenState();
}

class _AddIncomeExpenseScreenState extends State<AddIncomeExpenseScreen> {
  final formKey = GlobalKey<FormState>();
  late String amount, note;
  DateTime dateTime = DateTime.now();

  IncomeExpenseController incomeExpenseController = IncomeExpenseController();
  MetaDataController metaDataController = MetaDataController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, screenHeight(0.03, context), 0, screenHeight(0.08, context)),
                  child: Container(
                    // Screen sum 100 = 2 of top padding + 24 of illustration + 58 of form container
                    // height: screenHeight(0.58, context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(screenWidth(0.02, context), 0, screenWidth(0.02, context), 0),
                          child: WidgetManager.getTextFormField(
                              TextFormFieldConfig(
                                  labelText: "Amount",
                                  hintText: " 0",
                                  keyboardType: TextInputType.number,
                                  maxLength: 8,
                                  validatorCallback: widget.category.transactionType == TransactionType.income.name
                                      ? Validator.validateAmountField
                                      : Validator.validateLendExpenseField,
                                  onSavedCallback: (value) => amount = value!),
                              context),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), 0, screenWidth(0.02, context),
                              screenHeight(0.02, context)),
                          child: WidgetManager.getTextFormField(
                              TextFormFieldConfig(
                                  labelText: "Notes",
                                  hintText: " Shopping",
                                  keyboardType: TextInputType.name,
                                  maxLength: 100,
                                  validatorCallback: Validator.validateNothing,
                                  onSavedCallback: (value) => note = value!),
                              context),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(0, screenHeight(0.04, context), 0, screenHeight(0.06, context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/icons/calendar.png',
                                    fit: BoxFit.fill,
                                    height: screenHeight(0.05, context),
                                    width: screenHeight(0.05, context),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: screenWidth(0.02, context))),
                                  Calendar.getCalendar((value) => dateTime = value),
                                ],
                              ),
                              Image.asset(
                                'assets/images/icons/camera.png',
                                fit: BoxFit.fill,
                                height: screenHeight(0.05, context),
                                width: screenHeight(0.05, context),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: FloatingActionButton.extended(
                              label: Text(
                                "SAVE",
                                style: TextStyle(fontSize: screenHeight(0.02, context), color: Colors.white),
                              ),
                              backgroundColor: ColorManager.PRIMARY_BLUE,
                              onPressed: () {
                                formKey.currentState!.save();
                                if (formKey.currentState!.validate()) {
                                  incomeExpenseController.addIncomeExpense(
                                    History(
                                        year: dateTime.year,
                                        month: dateTime.month,
                                        date: dateTime.day,
                                        day: dateTime.weekday,
                                        dateTime: dateTime,
                                        name: note,
                                        amount: double.parse(amount),
                                        isIncome: widget.category.transactionType == TransactionType.income.name
                                            ? true
                                            : false,
                                        category: widget.category.name,
                                        icon: widget.category.icon),
                                  );
                                  metaDataController.updateExpendableAmount(
                                      widget.category.transactionType == TransactionType.income.name,
                                      double.parse(amount),
                                      true,
                                      widget.category.transactionType != TransactionType.investment.name);
                                  GoRouter.of(context).pushNamed(AppRouteConstants.budget);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.5,
                  child: getImageToDisplay(widget.category.icon,
                      'assets/images/illustrations/male/maleIncomeExpense.svg', 0.3, 0.3, context),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
