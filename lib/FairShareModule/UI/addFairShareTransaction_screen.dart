import 'package:budgetlab/FairShareModule/fairShare_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import 'package:budgetlab/BudgetModule/History/history_entity.dart';
import '../../Shared/color_manager.dart';
import '../../Shared/model/TextFormFieldConfig.dart';
import '../../Shared/routes_manager.dart';
import '../FairShare_Entities/group_entity.dart';

import 'package:budgetlab/Shared/widgets/calendar.dart' as Calendar;
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../FairShare_Entities/transactions_entity.dart';

class AddFairShareTransactionScreen extends StatefulWidget {
  final Group group;
  const AddFairShareTransactionScreen({Key? key, required this.group}) : super(key: key);

  @override
  State<AddFairShareTransactionScreen> createState() => _AddFairShareTransactionScreenState();
}

class _AddFairShareTransactionScreenState extends State<AddFairShareTransactionScreen> {
  FairShareController fairShareController = FairShareController();

  final formKey = GlobalKey<FormState>();
  late String amount, note;
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Expense"),
          backgroundColor: ColorManager.PRIMARY_BLUE,
          foregroundColor: Colors.white,
        ),
        body: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, screenHeight(0.02, context), 0, screenHeight(0.02, context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), 0, screenWidth(0.02, context), 0),
                        child: WidgetManager.getTextFormField(
                            TextFormFieldConfig(
                                labelText: "Amount",
                                hintText: " 0",
                                keyboardType: TextInputType.number,
                                maxLength: 8,
                                validatorCallback: Validator.validateAmountField,
                                onSavedCallback: (value) => amount = value!),
                            context),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth(0.02, context), 0, screenWidth(0.02, context), screenHeight(0.03, context)),
                        child: WidgetManager.getTextFormField(
                            TextFormFieldConfig(
                                labelText: "Description",
                                hintText: " Shopping",
                                keyboardType: TextInputType.name,
                                maxLength: 100,
                                validatorCallback: Validator.validateNothing,
                                onSavedCallback: (value) => note = value!),
                            context),
                      ),

                      /// Display widgets based on Group / Individual transaction
                      if (widget.group != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Paid by  ",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 3, 10, 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorManager.BLUE.withOpacity(1),
                                    blurRadius: 1,
                                    offset: const Offset(1, 1), // shadow position
                                  ),
                                ],
                              ),
                              child: Text(
                                " you ",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              "  and split  ",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 3, 10, 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorManager.BLUE.withOpacity(1),
                                    blurRadius: 1,
                                    offset: const Offset(1, 1), // shadow position
                                  ),
                                ],
                              ),
                              child: Text(
                                " equally ",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 3, 10, 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorManager.BLUE.withOpacity(1),
                                    blurRadius: 1,
                                    offset: const Offset(1, 1), // shadow position
                                  ),
                                ],
                              ),
                              child: Text(
                                " Paid by you and split equally ",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, screenHeight(0.06, context), 0, screenHeight(0.06, context)),
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
                              style: TextStyle(color: Colors.white, fontSize: screenHeight(0.02, context)),
                            ),
                            backgroundColor: ColorManager.PRIMARY_BLUE,
                            onPressed: () {
                              formKey.currentState!.save();
                              if (formKey.currentState!.validate()) {
                                fairShareController.addNewGroupTransaction(
                                  Transactions(
                                      dateTime: dateTime,
                                      name: note,
                                      friendId: "00000",
                                      groupId: widget.group?.id.toString() ?? "",
                                      amount: double.parse(amount)),
                                  History(
                                      year: dateTime.year,
                                      month: dateTime.month,
                                      date: dateTime.day,
                                      day: dateTime.weekday,
                                      dateTime: dateTime,
                                      name: note,
                                      amount: double.parse(amount),
                                      isIncome: false,
                                      category: "",
                                      icon: ""),
                                );
                                // Before Deleting Check if updateExpendableAmount is working as updateCurrentBalance
                                // metaDataController.updateCurrentBalance(
                                //     provider.transactionType.name == TransactionType.income.name,
                                //     double.parse(amount),
                                //     provider.transactionType.name != TransactionType.investment.name);
                                // metaDataController.updateExpendableAmount(
                                //     provider.transactionType.name == TransactionType.income.name,
                                //     double.parse(amount), true, provider.transactionType.name != TransactionType.investment.name);
                                GoRouter.of(context).pushNamed(AppRouteConstants.groupScreen, extra: widget.group);
                              }
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 30),
                        child: SizedBox(
                          height: screenHeight(0.3, context),
                          child: Opacity(
                            opacity:
                                0.6, // Adjust the opacity as needed (1.0 is fully opaque, 0.0 is fully transparent)
                            child: SvgPicture.asset(
                              'assets/images/illustrations/male/maleIncomeExpense.svg',
                              height: screenHeight(0.40, context),
                              width: screenWidth(0.9, context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
