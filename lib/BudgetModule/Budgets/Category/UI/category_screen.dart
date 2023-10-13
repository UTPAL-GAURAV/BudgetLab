import 'dart:io';

import 'package:budgetlab/BudgetModule/Budgets/Category/UI/scrollableCategoryIcons.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_controller.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/enums_manager.dart';
import 'package:budgetlab/Shared/service/gallery_service.dart';
import 'package:budgetlab/Shared/service/providers/category_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/model/TextFormFieldConfig.dart';
import '../../../../Shared/routes_manager.dart';
import '../../../../Shared/service/common_service.dart';
import '../../../../Shared/widgets/widget_manager.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required bool showDeleteButton}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState(showDeleteButton: false);
}

class _CategoryScreenState extends State<CategoryScreen> {
  _CategoryScreenState({required this.showDeleteButton});

  GalleryService galleryService = GalleryService();
  CategoryController categoryController = CategoryController();
  final formKey = GlobalKey<FormState>();

  bool isBudgetCapped = false;
  bool isExpense = true;
  bool addToNextCycle = true;
  late String budgetCycleAmount, categoryName, selectedIcon;
  bool showDeleteButton = false;

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ],
        child: Consumer<CategoryProvider>(builder: (context, provider, child) {
          return Form(
            key: formKey,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Category'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.02, context),
                              screenWidth(0.02, context), screenHeight(0.04, context)),
                          child: WidgetManager.getTextFormField(
                              TextFormFieldConfig(
                                  labelText: "Category Name",
                                  hintText: " Shopping",
                                  keyboardType: TextInputType.name,
                                  maxLength: 15,
                                  validatorCallback: Validator.validateNothing,
                                  onSavedCallback: (value) => categoryName = value!),
                              context),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), 0, screenWidth(0.02, context), 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Select Icon",
                              style: TextStyle(color: ColorManager.DARK_GREY, fontSize: height(0.02, context)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(0.14, context),
                          child: getScrollableCategoryIcons((value) => selectedIcon = value),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), 0, screenWidth(0.02, context), 0),
                          child: Row(
                            children: [
                              const Text("CAP?"),
                              CupertinoSwitch(
                                  value: isBudgetCapped,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isBudgetCapped = newValue;
                                    });
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Visible when only Category needs to be set
                    Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), 0, screenWidth(0.02, context), 0),
                      child: Visibility(
                        visible: !isBudgetCapped,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(screenWidth(0.02, context), 0, screenWidth(0.02, context), 0),
                              child: getTransactionTypeButtonsInARow(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Visible when capped budget needs to be set
                    Padding(
                      padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), 0, screenWidth(0.02, context), 0),
                      child: Visibility(
                        visible: isBudgetCapped,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text("It's an "),
                                CupertinoSwitch(
                                    // It can either be Expense or Investment, because Income should not be capped
                                    value: isExpense,
                                    onChanged: (bool newValue) {
                                      setState(() {
                                        isExpense = newValue;
                                      });
                                    })
                              ],
                            ),
                            getBudgetCycleButtonsInARow(),
                            WidgetManager.getTextFormField(
                                TextFormFieldConfig(
                                    labelText: "${provider.selectedBudgetCycle.name} Budget",
                                    hintText: " 0",
                                    keyboardType: TextInputType.number,
                                    maxLength: 8,
                                    validatorCallback: Validator.validateAmountField,
                                    onSavedCallback: (value) => budgetCycleAmount = value!),
                                context),
                            Row(
                              children: [
                                const Text("Refresh? "),
                                CupertinoSwitch(
                                    // It can either be Expense or Investment, because Income should not be capped
                                    value: addToNextCycle,
                                    onChanged: (bool newValue) {
                                      setState(() {
                                        addToNextCycle = newValue;
                                      });
                                    })
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: screenHeight(0.04, context))),
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
                            if(!isBudgetCapped) {
                              // Save only category
                              categoryController.addCategory(Category(
                                  transactionType: provider.selectedTransactionType.name,
                                  name: categoryName,
                                  icon: selectedIcon,
                                  isCap: false,
                                  cycle: BudgetCycle.none.name,
                                  cycleBudget: 0,
                                  addToNextCycle: false,
                                  currentCycleAmountLeft: 0,
                                  totalCycleAmount: 0,
                                  totalAmountSpent: 0,
                              ));
                            } else {
                              // Save Budget
                              categoryController.addCategory(Category(
                                transactionType: provider.selectedTransactionType.name,
                                name: categoryName,
                                icon: selectedIcon,
                                isCap: true,
                                cycle: provider.selectedBudgetCycle.name,
                                cycleBudget: double.parse(budgetCycleAmount),
                                addToNextCycle: addToNextCycle,
                                currentCycleAmountLeft: double.parse(budgetCycleAmount),
                                totalCycleAmount: double.parse(budgetCycleAmount),
                                totalAmountSpent: 0,
                              ));
                            }
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: routes['/addIncomeExpense']!));
                          }
                        },
                      ),
                    )
                    //TODO: Show delete button when user comes from budget screen
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
