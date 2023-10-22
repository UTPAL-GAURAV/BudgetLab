import 'package:budgetlab/BudgetModule/Savings/saings_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_controller.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:go_router/go_router.dart';

import '../../../Shared/model/TextFormFieldConfig.dart';
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../../../Shared/routes_manager.dart';
import 'getScrollableSavingsCategory.dart';

class AddSavingsScreen extends StatefulWidget {
  const AddSavingsScreen({Key? key}) : super(key: key);

  @override
  State<AddSavingsScreen> createState() => _AddSavingsScreenState();
}

class _AddSavingsScreenState extends State<AddSavingsScreen> {
  final formKey = GlobalKey<FormState>();
  late String targetAmount, title;
  String icon = 'Car';

  SavingsController savingsController = SavingsController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(ConstantsManager.ADD_SAVINGS),
        ),
        body: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Column(children: [
            WidgetManager.getTextFormField(TextFormFieldConfig(
                labelText: "Title",
                hintText: " Car, House",
                keyboardType: TextInputType.name,
                maxLength: 100,
                validatorCallback: Validator.validateNothing,
                onSavedCallback: (value) => title = value!), context),
            WidgetManager.getTextFormField(TextFormFieldConfig(
                labelText: "Amount",
                hintText: " 0",
                keyboardType: TextInputType.number,
                maxLength: 8,
                validatorCallback: Validator.validateLendExpenseField,
                onSavedCallback: (value) => targetAmount = value!), context),
            // const Text("Category"),
            // SizedBox(
            //   height: 100,
            //   child: getScrollableSavingsCategory((value) => icon = value),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                child: FloatingActionButton.extended(
                    label: const Text("Save"),
                    onPressed: () {
                      formKey.currentState!.save();
                      if (formKey.currentState!.validate()) {
                        savingsController.addSavings(Savings(
                            title: title,
                            targetAmount: double.parse(targetAmount),
                            icon: icon,
                            savedAmount: 0));
                        GoRouter.of(context).pushNamed(AppRouteConstants.home);
                      }
                    }),
              ),
            ),
          ]);
        }),
      ),
    );
  }
}
