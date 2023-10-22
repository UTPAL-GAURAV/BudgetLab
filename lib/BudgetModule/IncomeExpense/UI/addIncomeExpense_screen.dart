import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import 'package:budgetlab/BudgetModule/IncomeExpense/incomeExpense_controller.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:budgetlab/SettingsModule/metadata_controller.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/enums_manager.dart';
import 'package:budgetlab/Shared/model/TextFormFieldConfig.dart';
import 'package:budgetlab/BudgetModule/IncomeExpense/UI/scrollableIncomeExpenseCategory.dart';
import 'package:budgetlab/Shared/service/providers/incomeExpense_provider.dart';
import 'package:budgetlab/Shared/widgets/toggleButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:budgetlab/Shared/widgets/calendar.dart' as Calendar;
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../Shared/constants_manager.dart';
import '../../../Shared/routes_manager.dart';

class AddIncomeExpenseScreen extends StatefulWidget {
  const AddIncomeExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddIncomeExpenseScreen> createState() => _AddIncomeExpenseScreenState();
}

class _AddIncomeExpenseScreenState extends State<AddIncomeExpenseScreen> {
  final formKey = GlobalKey<FormState>();
  late String amount, note;
  DateTime dateTime = DateTime.now();
  String category = '';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => IncomeExpenseProvider()),
        ],
        child: Consumer<IncomeExpenseProvider>(builder: (context, provider, child) {
          return Form(
            key: formKey,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(ConstantsManager.ADD_INCOME_EXPENSE),
                backgroundColor: ColorManager.PRIMARY_BLUE,
              ),
              body: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: screenHeight(0.02, context))),
                      SvgPicture.asset(
                        'assets/images/illustrations/male/maleIncomeExpense.svg',
                        fit: BoxFit.fill,
                        height: screenHeight(0.24, context),
                        width: screenWidth(0.9, context),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, screenHeight(0.02, context), 0, screenHeight(0.04, context)),
                        child: Container(
                          // Screen sum 100 = 2 of top padding + 24 of illustration + 58 of form container
                          height: screenHeight(0.58, context),
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
                                        validatorCallback: provider.transactionType.name == TransactionType.income.name
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
                              // const Text("Category"),
                              SizedBox(
                                height: screenHeight(0.14, context),
                                child: getScrollableIncomeExpenseCategory((value) => category = value),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0, screenHeight(0.04, context), 0, screenHeight(0.06, context)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/calendar.png',
                                      fit: BoxFit.fill,
                                      height: screenHeight(0.05, context),
                                      width: screenHeight(0.05, context),
                                    ),
                                    Padding(padding: EdgeInsets.only(left: screenWidth(0.04, context))),
                                    Calendar.getCalendar((value) => dateTime = value),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.90,
                                child: FloatingActionButton.extended(
                                    label: Text(
                                      "SAVE",
                                      style: TextStyle(fontSize: screenHeight(0.02, context)),
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
                                              isIncome:
                                                  provider.transactionType.name == TransactionType.income.name ? true : false,
                                              category: category),
                                        );
                                        metaDataController.updateCurrentBalance(
                                            provider.transactionType.name == TransactionType.income.name,
                                            double.parse(amount), provider.transactionType.name != TransactionType.investment.name);
                                        GoRouter.of(context).pushNamed(AppRouteConstants.home);
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        }));
  }
}
