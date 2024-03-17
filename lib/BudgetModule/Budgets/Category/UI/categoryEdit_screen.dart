import 'package:budgetlab/BudgetModule/Budgets/Category/UI/scrollableCategoryIcons.dart';
import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:budgetlab/Shared/widgets/widget_manager.dart' as WidgetManager;
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../../../../HomeModule/UI/homePage_screen.dart';
import '../../../../Shared/color_manager.dart';
import '../../../../Shared/enums_manager.dart';
import '../../../../Shared/model/TextFormFieldConfig.dart';
import '../../../../Shared/routes_manager.dart';
import '../../../../Shared/service/common_service.dart';
import '../../../../Shared/service/gallery_service.dart';
import '../../../../Shared/service/providers/category_provider.dart';
import '../../../../Shared/widgets/widget_manager.dart';
import '../category_controller.dart';
import 'categoryDelete_popUp.dart';

class CategoryEditScreen extends StatefulWidget {
  final Category category;
  const CategoryEditScreen({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryEditScreen> createState() => _CategoryEditScreenState();
}

class _CategoryEditScreenState extends State<CategoryEditScreen> {
  GalleryService galleryService = GalleryService();
  CategoryController categoryController = CategoryController();
  final formKey = GlobalKey<FormState>();

  bool isBudgetCapped = false;
  bool isExpense = true;
  bool addToNextCycle = true;
  late String budgetCycleAmount, categoryName, selectedIcon, originalName;

  void initState() {
    super.initState();
    categoryName = widget.category.name;
    isBudgetCapped = widget.category.isCap;
    budgetCycleAmount = widget.category.cycleBudget.toString();
    addToNextCycle = widget.category.addToNextCycle;
    selectedIcon = widget.category.icon;
    originalName = widget.category.name;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ],
        child: Consumer<CategoryProvider>(builder: (context, provider, child) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.02, context),
                            screenWidth(0.02, context), screenHeight(0.04, context)),
                        child: WidgetManager.getTextFormField(
                            TextFormFieldConfig(
                                labelText: "Budget Name",
                                hintText: widget.category.name,
                                initialText: widget.category.name,
                                keyboardType: TextInputType.name,
                                maxLength: 15,
                                validatorCallback: Validator.validateCategoryDuplicateValueField,
                                onSavedCallback: (value) => categoryName = value!),
                            context),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), 0, screenWidth(0.02, context), 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Select Icon",
                            style: TextStyle(
                                color: ColorManager.BLACK_VOID,
                                fontSize: height(0.02, context),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(0.14, context),
                        child: getScrollableCategoryIcons((value) => selectedIcon = value),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.03, context), screenWidth(0.02, context), 0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "CAP?",
                                    style: TextStyle(
                                        color: ColorManager.BLACK_VOID,
                                        fontSize: height(0.02, context),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "No max limit on this budget",
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: CupertinoSwitch(
                                  value: isBudgetCapped,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isBudgetCapped = newValue;
                                    });
                                  }),
                            ),
                            Expanded(
                                flex: 4,
                                child: Text(
                                  "Assign max limit to this budget",
                                  softWrap: true,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Note: Transaction Type can never change.
                  // Visible when capped budget needs to be set
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), screenHeight(0.05, context), screenWidth(0.02, context), 0),
                    child: Visibility(
                      visible: isBudgetCapped,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Select Budget Cycle ",
                              style: TextStyle(
                                  color: ColorManager.BLACK_VOID,
                                  fontSize: height(0.02, context),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: screenHeight(0.02, context), bottom: screenHeight(0.05, context)),
                            child: getBudgetCycleButtonsInARow(),
                          ),
                          WidgetManager.getTextFormField(
                              TextFormFieldConfig(
                                  labelText: "Set ${provider.selectedBudgetCycle.name} Budget",
                                  hintText: " 0",
                                  initialText: budgetCycleAmount,
                                  keyboardType: TextInputType.number,
                                  maxLength: 8,
                                  validatorCallback: Validator.validateAmountField,
                                  onSavedCallback: (value) => budgetCycleAmount = value!),
                              context),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight(0.04, context)),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Refresh? ",
                                        style: TextStyle(
                                            color: ColorManager.BLACK_VOID,
                                            fontSize: height(0.02, context),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Text(
                                        "Fresh budget will start in next cycle ",
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: CupertinoSwitch(
                                      // It can either be Expense or Investment, because Income should not be capped
                                      value: addToNextCycle,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          addToNextCycle = newValue;
                                        });
                                      }),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: const Text(
                                    "Leftover or extra amount spent will be adjusted in the next cycle",
                                    softWrap: true,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: screenHeight(0.08, context))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: FloatingActionButton.extended(
                      label: Text(
                        "SAVE",
                        style: TextStyle(fontSize: screenHeight(0.02, context), color: Colors.white),
                      ),
                      backgroundColor: ColorManager.PRIMARY_BLUE,
                      onPressed: () {
                        formKey.currentState!.save();
                        if (formKey.currentState!.validate()) {
                          if (!isBudgetCapped) {
                            // Save only category
                            categoryController.updateCategory(
                                Category(
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
                                ),
                                originalName);
                          } else {
                            // Save Budget
                            categoryController.updateCategory(
                                Category(
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
                                ),
                                originalName);
                          }
                          GoRouter.of(context).pushNamed(AppRouteConstants.budget);
                        }
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: FloatingActionButton.extended(
                          label: Text(
                            "DELETE",
                            style: TextStyle(fontSize: screenHeight(0.02, context), color: Colors.white),
                          ),
                          backgroundColor: ColorManager.EXPENSE_RED,
                          onPressed: () {
                            categoryDeletePopUp(context, categoryName);
                          })),
                  Padding(padding: EdgeInsets.only(top: 40)),
                ],
              ),
            ),
          );
        }));
  }
}
