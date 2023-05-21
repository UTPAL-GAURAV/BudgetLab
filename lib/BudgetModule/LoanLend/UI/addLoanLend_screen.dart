import 'package:budgetlab/Shared/service/avatar_service.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/widgets/calendar.dart' as Calendar;
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../../../Shared/constants_manager.dart';
import '../../../Shared/routes_manager.dart';
import '../loanLend_controller.dart';

class AddLoanLendScreen extends StatefulWidget {
  const AddLoanLendScreen({Key? key}) : super(key: key);

  @override
  State<AddLoanLendScreen> createState() => _AddLoanLendScreenState();
}

class _AddLoanLendScreenState extends State<AddLoanLendScreen> {
  final formKey = GlobalKey<FormState>();
  late String name, amount, notes;
  late DateTime date;

  LoanLendController loanLendController = LoanLendController();
  AvatarService avatarService = AvatarService();

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
                  WidgetManager.getTextFormField(
                      "Name",
                      " John",
                      TextInputType.name,
                      40,
                      Validator.validateNameField,
                          (value) => name = value!),
                  WidgetManager.getTextFormField(
                      "Amount",
                      " 0",
                      TextInputType.number,
                      8,
                      Validator.validateLendExpenseField,
                          (value) => amount = value!),
                  Calendar.getCalendar(),
                  WidgetManager.getTextFormField(
                      "Notes",
                      " For tuition fees.",
                      TextInputType.name,
                      100,
                      Validator.validateNothing,
                          (value) => notes = value!),
                  TextButton(
                      child: const Text(ConstantsManager.SAVE),
                      onPressed: () {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          loanLendController.addLoanLend(
                              true,
                              DateTime.now(),
                              DateTime.now(),
                              int.parse(amount),
                              name,
                              notes,
                              "",
                              "",
                              avatarService.getGenderAvatarFromName(name)
                              as String);
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
