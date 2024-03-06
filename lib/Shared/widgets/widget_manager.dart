import 'dart:io';

import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:budgetlab/Shared/enums_manager.dart';
import 'package:budgetlab/Shared/model/TextFormFieldConfig.dart';
import 'package:budgetlab/Shared/model/callback_model.dart';
import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;
import 'package:provider/provider.dart';

import '../color_manager.dart';
import '../service/providers/category_provider.dart';

/// Global Vars to be used by Widgets //////////////////////////////////////////

/// BUTTONS ////////////////////////////////////////////////////////////////////
getIconWithLabelButtons(Category category, BuildContext context, bool isSelected) {
  return Container(
    height: screenHeight(0.12, context),
    constraints: BoxConstraints(
      minWidth: 90,
    ),
    decoration: BoxDecoration(
      color: isSelected
          ? category.transactionType == TransactionType.expense.name
              ? ColorManager.BACKGROUND_LIGHT_RED
              : ColorManager.BACKGROUND_LIGHT_GREEN
          : null,
      border: Border.all(
        color: category.transactionType == TransactionType.expense.name
            ? ColorManager.EXPENSE_RED
            : ColorManager.INCOME_GREEN, // Set the border color
        width: 1.2, // Set the border width
      ),
      borderRadius: BorderRadius.circular(8), // Set the border radius
    ),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.icon,
            fit: BoxFit.fill,
            height: screenHeight(0.06, context),
            width: screenHeight(0.06, context),
          ),
          SizedBox(height: screenHeight(0.01, context)), // Adjust the spacing between the icon and text
          Text(
            category.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: ColorManager.BLACK_VOID, fontSize: screenHeight(0.02, context)),
          ), // Replace with your desired text
        ],
      ),
    ),
  );
}

getIconButtons(String path, BuildContext context, bool isSelected) {
  return Container(
    height: screenHeight(0.12, context),
    width: screenHeight(0.12, context),
    constraints: BoxConstraints(maxWidth: 80, maxHeight: 80),
    decoration: BoxDecoration(
      color: isSelected ? ColorManager.BACKGROUND_LIGHT_BLUE : null,
      border: Border.all(
        color: ColorManager.FLUTTER_BLUE, // Set the border color
        width: 1.2, // Set the border width
      ),
      borderRadius: BorderRadius.circular(50), // Set the border radius
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50), // Ensure image is clipped to the container's border
      child: path.startsWith('assets/')
          ? Image.asset(
              path,
              fit: BoxFit.fill,
              height: screenHeight(0.01, context),
              width: screenHeight(0.01, context), // Ensure the image covers the entire container
            )
          : Image.file(
              File(path),
              fit: BoxFit.cover, // Ensure the image covers the entire container
            ),
    ),
  );
}

getLastIconEditButton(BuildContext context) {
  return Container(
    height: screenHeight(0.12, context),
    constraints: BoxConstraints(
      minWidth: 90,
    ),
    decoration: BoxDecoration(
      color: ColorManager.BACKGROUND_LIGHT_BLUE,
      border: Border.all(
        color: ColorManager.PRIMARY_BLUE, // Set the border color
        width: 1.2, // Set the border width
      ),
      borderRadius: BorderRadius.circular(8), // Set the border radius
    ),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/icons/edit.png',
            fit: BoxFit.fill,
            height: screenHeight(0.06, context),
            width: screenHeight(0.06, context),
          ),
        ],
      ),
    ),
  );
}

/// Text Boxes /////////////////////////////////////////////////////////////////
getHeaderDividerSizedBox(String displayText) {
  return Container(
    color: ColorManager.LIGHT_GREY,
    child: Row(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(14, 16, 0, 10),
        child: Text(
          displayText,
          style: TextStyle(
            color: ColorManager.DARK_GREY,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
      ),
    ]),
  );
}

getTextFormField(TextFormFieldConfig config, BuildContext context) {
  return TextFormField(
    style: TextStyle(fontSize: screenHeight(0.02, context)),
    decoration: InputDecoration(
      hintText: config.hintText,
      labelText: config.labelText,
    ),
    initialValue: config.initialText,
    keyboardType: config.keyboardType,
    maxLength: config.maxLength,
    validator: (value) {
      String response = config.validatorCallback(value!);
      return response.isNotEmpty ? response : null;
    },
    onSaved: config.onSavedCallback,
    onFieldSubmitted: (value) {
      if (config.onFieldSubmitted != null) {
        config.onFieldSubmitted!(value);
      }
    },
  );
}

getTransactionTypeButtonsInARow() {
  return Consumer<CategoryProvider>(builder: (context, provider, child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton.extended(
            label: const Text("Expense"),
            icon: provider.selectedTransactionType == TransactionType.expense
                ? Container(width: 24, height: 24, child: Image.asset('assets/images/icons/expense.png'))
                : null,
            onPressed: () {
              provider.setSelectedTransactionType(TransactionType.expense);
            }),
        FloatingActionButton.extended(
            label: const Text("Income"),
            icon: provider.selectedTransactionType == TransactionType.income
                ? Container(width: 24, height: 24, child: Image.asset('assets/images/icons/income.png'))
                : null,
            onPressed: () {
              provider.setSelectedTransactionType(TransactionType.income);
            }),
        FloatingActionButton.extended(
            label: const Text("Investment"),
            icon: provider.selectedTransactionType == TransactionType.investment
                ? Container(width: 24, height: 24, child: Image.asset('assets/images/icons/investment.png'))
                : null,
            onPressed: () {
              provider.setSelectedTransactionType(TransactionType.investment);
            }),
      ],
    );
  });
}

getBudgetCycleButtonsInARow() {
  return Consumer<CategoryProvider>(builder: (context, provider, child) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton.extended(
            label: Text(BudgetCycle.Weekly.name),
            icon: provider.selectedBudgetCycle == BudgetCycle.Weekly
                ? Container(width: 24, height: 24, child: Image.asset('assets/images/icons/weekly.png'))
                : null,
            onPressed: () {
              provider.setSelectedBudgetCycle(BudgetCycle.Weekly);
            }),
        FloatingActionButton.extended(
            label: Text(BudgetCycle.Monthly.name),
            icon: provider.selectedBudgetCycle == BudgetCycle.Monthly
                ? Container(width: 24, height: 24, child: Image.asset('assets/images/icons/monthly.png'))
                : null,
            onPressed: () {
              provider.setSelectedBudgetCycle(BudgetCycle.Monthly);
            }),
        FloatingActionButton.extended(
            label: Text(BudgetCycle.Yearly.name),
            icon: provider.selectedBudgetCycle == BudgetCycle.Yearly
                ? Container(width: 24, height: 24, child: Image.asset('assets/images/icons/yearly.png'))
                : null,
            onPressed: () {
              provider.setSelectedBudgetCycle(BudgetCycle.Yearly);
            }),
      ],
    );
  });
}

/// BANNERS ////////////////////////////////////////////////////////////////////

getTwinBanners(String title, String subtitle, Color color, double height, double width) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: ColorManager.DARK_GREY2),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
            )
          ],
        ),
      ),
    ),
  );
}

getSingleBanner(String title, String subtitle, Color color, double height, double width) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: ColorManager.GREY),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subtitle,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
            )
          ],
        ),
      ),
    ),
  );
}

/// LABELS ////////////////////////////////////////////////////////////////////

Container getBudgetMessageForUser(double budgetUsedInPercentage, BuildContext context) {
  String message = "You're doing great!";

  if (budgetUsedInPercentage >= 1.0) {
    message = "Hey! Take a break";
  } else if (budgetUsedInPercentage > 0.8) {
    message = "Slow down buddy!";
  }

  return Container(
    child: Row(
      children: [
        Text(
          message,
          style: TextStyle(color: ColorManager.DARK_GREY, fontSize: screenHeight(0.016, context)),
        ),
        Padding(padding: EdgeInsets.only(left: screenWidth(0.026, context))),
        getBudgetIconForUser(budgetUsedInPercentage, context),
      ],
    ),
  );
}

getBudgetIconForUser(double budgetUsedInPercentage, BuildContext context) {
  String path = 'assets/images/icons/like.png';

  if (budgetUsedInPercentage >= 1.0) {
    path = "assets/images/icons/no-money.png";
  } else if (budgetUsedInPercentage > 0.8) {
    path = "assets/images/icons/warning.png";
  }

  return Container(
    padding: EdgeInsets.only(bottom: screenHeight(0.006, context)),
    child: Image.asset(
      path,
      fit: BoxFit.fill,
      height: screenHeight(0.02, context),
      width: screenHeight(0.02, context), // Ensure the image covers the entire container
    ),
  );
}

/// PICTURES ////////////////////////////////////////////////////////////////////

getImageToDisplay(String path, String backupImage, double height, double width, BuildContext context) {
  Uri? uri = Uri.tryParse(path);

  return ClipRRect(
    // Ensure image is clipped to the container's border
    child: path.startsWith('assets/')
        ? Image.asset(
            path,
            fit: BoxFit.fill,
            height: screenWidth(height, context),
            width: screenWidth(width, context), // Ensure the image covers the entire container
          )
        : File(path).existsSync() // Check if the file exists
            ? Image.file(
                File(path),
                fit: BoxFit.cover,
                height: screenWidth(height, context),
                width: screenWidth(width, context), // Ensure the image covers the entire container
              )
            // In case user deletes File path image
            : (uri != null && (uri.scheme == 'http' || uri.scheme == 'https'))
                ? Image.network(
                    path,
                    fit: BoxFit.cover,
                    height: screenWidth(height, context),
                    width: screenWidth(width, context), // Ensure the image covers the entire container
                  )
                : Image.asset(
                    backupImage, // Path to your default image in the assets folder
                    fit: BoxFit.fill,
                    height: screenWidth(height, context),
                    width: screenWidth(width, context), // Ensure the image covers the entire container
                  ),
  );
}
