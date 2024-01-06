import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/UI/scrollableSavingsTransactions.dart';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_controller.dart';
import 'package:budgetlab/BudgetModule/Savings/Savings_SavingsTransactions/savingsTransactions_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/constants_manager.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../../../../Shared/model/TextFormFieldConfig.dart';
import '../../../../Shared/routes_manager.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.savings.title),
      ),
      body: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.02, context),
                      screenWidth(0.02, context), screenHeight(0.04, context)),
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
                  padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.02, context),
                      screenWidth(0.02, context), screenHeight(0.04, context)),
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
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: FloatingActionButton.extended(
                        label: const Text("Save"),
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
          getScrollableSavingsTransactions(widget.savings.id),
        ],
      ),
    );
  }
}

