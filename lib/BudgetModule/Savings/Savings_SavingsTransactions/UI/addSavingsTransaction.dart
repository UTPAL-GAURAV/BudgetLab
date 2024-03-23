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
import '../../../../Shared/widgets/widget_manager.dart';
import '../../savings_entity.dart';

class AddSavingsTransaction extends StatefulWidget {
  final Savings savings;
  const AddSavingsTransaction({Key? key, required this.savings}) : super(key: key);

  @override
  State<AddSavingsTransaction> createState() => _AddSavingsTransactionState();
}

class _AddSavingsTransactionState extends State<AddSavingsTransaction> {
  SavingsTransactionsController savingsTransactionsController = SavingsTransactionsController();
  final formKey = GlobalKey<FormState>();
  late String savingsTransactionAmount, savingsTransactionNote;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), 0, screenWidth(0.02, context),
              screenHeight(0.02, context)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, screenHeight(0.03, context), 0, screenHeight(0.03, context)),
                child: WidgetManager.getTextFormField(
                    TextFormFieldConfig(
                        labelText: "Amount",
                        hintText: "0",
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                        validatorCallback: Validator.validateLendExpenseField,
                        onSavedCallback: (value) => savingsTransactionAmount = value!),
                    context),
              ),
      
              WidgetManager.getTextFormField(
                    TextFormFieldConfig(
                        labelText: "Notes",
                        hintText: "Notes",
                        keyboardType: TextInputType.name,
                        maxLength: 15,
                        validatorCallback: Validator.validateNothing,
                        onSavedCallback: (value) => savingsTransactionNote = value!),
                    context),
      
              Padding(
                padding: EdgeInsets.only(top: screenHeight(0.06, context), bottom: screenHeight(0.08, context)),
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
              Opacity(
                opacity: 0.5,
                child: getImageToDisplay(widget.savings.icon, 'assets/images/stickers/savings.png', 0.3, 0.3, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
