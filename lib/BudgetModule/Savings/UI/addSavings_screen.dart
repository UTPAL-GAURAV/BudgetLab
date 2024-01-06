import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_controller.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../HomeModule/UI/homePage_screen.dart';
import '../../../Shared/model/TextFormFieldConfig.dart';
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../../../Shared/routes_manager.dart';
import 'package:budgetlab/Shared/widgets/calendar.dart' as Calendar;

import '../../../Shared/service/gallery_service.dart';
import '../../../Shared/widgets/widget_manager.dart';

class AddSavingsScreen extends StatefulWidget {
  const AddSavingsScreen({Key? key}) : super(key: key);

  @override
  State<AddSavingsScreen> createState() => _AddSavingsScreenState();
}

class _AddSavingsScreenState extends State<AddSavingsScreen> {
  GalleryService galleryService = GalleryService();
  final formKey = GlobalKey<FormState>();
  late String targetAmount, title;
  String icon = 'assets/images/icons/budgetCategory/piggy.png';
  DateTime dateTime = DateTime.now();

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
            GestureDetector(
              onTap: () async {
                Map<Permission, PermissionStatus> statuses = await [
                  Permission.storage,
                ].request();
                if (statuses[Permission.storage]!.isGranted) {}
                final xFile = await galleryService.getImageFromGallery(); // Open gallery when CircleAvatar is tapped
                // provider.setUploadedImage(xFile.path);
                // allIconsList.value.add(xFile.path);
              },
              child: Container(
                margin: const EdgeInsets.all(6),
                child: getLastIconEditButton(context),
              ),
            ),
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
                            savedAmount: 0,
                            icon: icon,
                            targetDateTime: dateTime));
                        GoRouter.of(context).pushNamed(AppRouteConstants.savings);
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
