import 'dart:io';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/UI/scrollableSavingsTransactions.dart';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_controller.dart';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/color_manager.dart';
import '../../../../Shared/constants_manager.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../../../../Shared/model/TextFormFieldConfig.dart';
import '../../../../Shared/routes_manager.dart';
import '../../../../Shared/service/common_service.dart';
import '../../savings_entity.dart';

class AddSavingsTransactionScreen extends StatefulWidget {
  late Savings savings;
  AddSavingsTransactionScreen({Key? key, required this.savings}) : super(key: key) {
    this.savings = savings;
  }

  @override
  State<AddSavingsTransactionScreen> createState() => _AddSavingsTransactionScreenState();
}

class _AddSavingsTransactionScreenState extends State<AddSavingsTransactionScreen> {
  SavingsTransactionsController savingsTransactionsController = SavingsTransactionsController();
  final formKey = GlobalKey<FormState>();
  late String savingsTransactionAmount, savingsTransactionNote;

  @override
  Widget build(BuildContext context) {
    String path = widget.savings.icon;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.savings.title),
        backgroundColor: ColorManager.PRIMARY_BLUE,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: ColorManager.PRIMARY_BACKGROUND,
        width: MediaQuery.of(context).size.width,
        height: screenHeight(1.0, context) - AppBar().preferredSize.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Positioned.fill ensures the ClipRect takes up the entire space
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.0), // Adjust the overlay color and opacity
                      ),
                      child: path.startsWith('assets/')
                          ? Image.asset(
                              path,
                              fit: BoxFit.fill,
                              height: screenHeight(0.04, context),
                              width: screenHeight(0.04, context),
                            )
                          : File(path).existsSync()
                              ? Image.file(
                                  File(path),
                                  fit: BoxFit.cover,
                                  height: screenHeight(0.04, context),
                                  width: screenHeight(0.04, context),
                                )
                              : Image.asset(
                                  'assets/images/icons/budgetCategory/piggy.png',
                                  fit: BoxFit.fill,
                                  height: screenHeight(0.04, context),
                                  width: screenHeight(0.04, context),
                                ),
                    ),
                  ),
                ),
                // White color overlay with opacity
                Positioned.fill(
                  child: Container(
                    color: const Color.fromRGBO(255, 255, 255, 0.82), // Adjust opacity (last parameter)
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: screenHeight(0.03, context)),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.PRIMARY_BLUE.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(4, 8), // shadow position
                      ),
                    ],
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.02, context),
                              screenWidth(0.02, context), screenHeight(0.00, context)),
                          child: WidgetManager.getTextFormField(
                              TextFormFieldConfig(
                                  labelText: "Amount",
                                  hintText: "0",
                                  keyboardType: TextInputType.number,
                                  maxLength: 8,
                                  validatorCallback: Validator.validateAmountField,
                                  onSavedCallback: (value) => savingsTransactionAmount = value!),
                              context),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.00, context),
                              screenWidth(0.02, context), screenHeight(0.02, context)),
                          child: WidgetManager.getTextFormField(
                              TextFormFieldConfig(
                                  labelText: "Note",
                                  hintText: "Note",
                                  keyboardType: TextInputType.name,
                                  maxLength: 15,
                                  validatorCallback: Validator.validateNothing,
                                  onSavedCallback: (value) => savingsTransactionNote = value!),
                              context),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: screenWidth(0.9, context),
                            child: FloatingActionButton.extended(
                                label: Text(
                                  "SAVE",
                                  style: TextStyle(color: Colors.white, fontSize: screenHeight(0.02, context)),
                                ),
                                backgroundColor: ColorManager.PRIMARY_BLUE,
                                onPressed: () {
                                  formKey.currentState!.save();
                                  if (formKey.currentState!.validate()) {
                                    savingsTransactionsController.addSavingsTransaction(SavingsTransactions(
                                        savingsId: widget.savings.id,
                                        amount: double.parse(savingsTransactionAmount),
                                        dateTime: DateTime.now(),
                                        notes: savingsTransactionNote));
                                    GoRouter.of(context).pushNamed(AppRouteConstants.savings);
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  screenWidth(0.04, context), screenHeight(0.04, context), 0, screenHeight(0.012, context)),
              child: Text(
                "Commitments",
                style: TextStyle(
                    color: ColorManager.DARK_GREY, fontSize: screenHeight(0.028, context), fontWeight: FontWeight.bold),
              ),
            ),
            getScrollableSavingsTransactions(widget.savings.id),
          ],
        ),
      ),
    );
  }
}
