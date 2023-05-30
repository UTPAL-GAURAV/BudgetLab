import 'package:budgetlab/Shared/service/avatar_service.dart';
import 'package:budgetlab/Shared/widgets/toggleButtons.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/widgets/calendar.dart' as Calendar;
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../../../Shared/constants_manager.dart';
import '../../../Shared/model/TextFormFieldConfig.dart';
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
  String avatar = AvatarService().getNeutralGenderAvatar();
  DateTime date = DateTime.now();
  bool isLoan = true;

  LoanLendController loanLendController = LoanLendController();
  AvatarService avatarService = AvatarService();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(ConstantsManager.ADD_LOAN_LEND),
        ),
        body: SingleChildScrollView(
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                getToggleButtons(
                    ["Loan", "Lend"], ((value) => isLoan = value == 0)),
                WidgetManager.getTextFormField(TextFormFieldConfig(
                  labelText: "Name",
                  hintText: " John",
                  keyboardType: TextInputType.name,
                  maxLength: 40,
                  validatorCallback: Validator.validateNameField,
                  onSavedCallback: (value) => name = value!,
                  onFieldSubmitted: (value) => AvatarService()
                      .getGenderAvatarFromName(value)
                      .then((avatarPath) => {avatar = avatarPath}),
                )),
                WidgetManager.getTextFormField(
                  TextFormFieldConfig(
                      labelText: "Amount",
                      hintText: " 0",
                      keyboardType: TextInputType.number,
                      maxLength: 8,
                      validatorCallback: Validator.validateLendExpenseField,
                      onSavedCallback: (value) => amount = value!),
                ),
                Calendar.getCalendar((value) => date = value),
                WidgetManager.getTextFormField(
                  TextFormFieldConfig(
                      labelText: "Notes",
                      hintText: " For tuition fees.",
                      keyboardType: TextInputType.name,
                      maxLength: 100,
                      validatorCallback: Validator.validateNothing,
                      onSavedCallback: (value) => notes = value!),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: FloatingActionButton.extended(
                        label: const Text("Save"),
                        onPressed: () {
                          formKey.currentState!.save();
                          if (formKey.currentState!.validate()) {
                            loanLendController.addLoanLend(
                                isLoan,
                                DateTime.now(),
                                date,
                                int.parse(amount),
                                name,
                                notes,
                                "",
                                "",
                                avatar);
                            Navigator.of(context).pop();
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(builder: routes['/loanLend']!));
                          }
                        }),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
