import 'package:budgetlab/BudgetModule/Savings/UI/savingsDelete_popUp.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_controller.dart';
import 'package:budgetlab/BudgetModule/Savings/savings_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;
import 'package:budgetlab/Shared/widgets/calendar.dart' as Calendar;

import '../../../HomeModule/UI/homePage_screen.dart';
import '../../../Shared/color_manager.dart';
import '../../../Shared/model/TextFormFieldConfig.dart';
import '../../../Shared/routes_manager.dart';
import '../../../Shared/service/gallery_service.dart';
import '../../../Shared/service/providers/savings_provider.dart';
import '../../../Shared/widgets/widget_manager.dart';

class SavingsEdit extends StatefulWidget {
  final Savings savings;
  const SavingsEdit({Key? key, required this.savings}) : super(key: key);

  @override
  State<SavingsEdit> createState() => _SavingsEditState();
}

class _SavingsEditState extends State<SavingsEdit> {
  GalleryService galleryService = GalleryService();
  SavingsController savingsController = SavingsController();
  final formKey = GlobalKey<FormState>();

  late String savingsTitle, savingsTargetAmount, originalTitle, savingsIcon;
  late DateTime savingsTargetDate;

  void initState() {
    super.initState();
    savingsTitle = widget.savings.title;
    savingsTargetAmount = widget.savings.targetAmount.toString();
    savingsTargetDate = widget.savings.targetDateTime;
    originalTitle = widget.savings.title;
    savingsIcon = widget.savings.icon;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SavingsProvider()),
        ],
        child: Consumer<SavingsProvider>(builder: (context, provider, child) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Map<Permission, PermissionStatus> statuses = await [
                            Permission.storage,
                          ].request();
                          if (statuses[Permission.storage]!.isGranted) {}
                          final xFile =
                              await galleryService.getImageFromGallery(); // Open gallery when CircleAvatar is tapped
                          provider.setUploadedImage(xFile.path);
                          // allIconsList.value.add(xFile.path);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(6),
                          child: getLastIconEditButton(context),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.02, context),
                            screenWidth(0.02, context), screenHeight(0.04, context)),
                        child: WidgetManager.getTextFormField(
                            TextFormFieldConfig(
                                labelText: "Savings Title",
                                hintText: widget.savings.title,
                                initialText: widget.savings.title,
                                keyboardType: TextInputType.name,
                                maxLength: 15,
                                validatorCallback: Validator.validateNothing,
                                onSavedCallback: (value) => savingsTitle = value!),
                            context),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.02, context),
                        screenWidth(0.02, context), screenHeight(0.04, context)),
                    child: WidgetManager.getTextFormField(
                        TextFormFieldConfig(
                            labelText: "Target Amount",
                            hintText: widget.savings.targetAmount.toString(),
                            initialText: savingsTargetAmount,
                            keyboardType: TextInputType.number,
                            maxLength: 8,
                            validatorCallback: Validator.validateAmountField,
                            onSavedCallback: (value) => savingsTargetAmount = value!),
                        context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icons/calendar.png',
                        fit: BoxFit.fill,
                        height: screenHeight(0.05, context),
                        width: screenHeight(0.05, context),
                      ),
                      Padding(padding: EdgeInsets.only(left: screenWidth(0.04, context))),
                      Calendar.getCalendar((value) => savingsTargetDate = value),
                    ],
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
                              savingsController.updateSavings(
                                  Savings(
                                      id: widget.savings.id,
                                      title: savingsTitle,
                                      targetAmount: double.parse(savingsTargetAmount),
                                      savedAmount: 0,
                                      icon: savingsIcon,
                                      targetDateTime: savingsTargetDate,
                                      startDateTime: widget.savings.startDateTime));
                              GoRouter.of(context).pushNamed(AppRouteConstants.savings);
                            }
                          }),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: FloatingActionButton.extended(
                          label: Text(
                            "DELETE",
                            style: TextStyle(fontSize: screenHeight(0.02, context)),
                          ),
                          backgroundColor: ColorManager.EXPENSE_RED,
                          onPressed: () {
                            savingsController.deleteSavingsById(widget.savings.id);
                            GoRouter.of(context).pushNamed(AppRouteConstants.savings);
                          }))
                ],
              ),
            ),
          );
        }));
  }
}
