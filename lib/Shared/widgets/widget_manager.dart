import 'package:budgetlab/BudgetModule/Budgets/Category/category_entity.dart';
import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:budgetlab/Shared/model/TextFormFieldConfig.dart';
import 'package:budgetlab/Shared/model/callback_model.dart';
import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../color_manager.dart';

/// Global Vars to be used by Widgets //////////////////////////////////////////

/// BUTTONS ////////////////////////////////////////////////////////////////////
getIconButtons(Category category, BuildContext context, bool isSelected) {
  return Container(
    height: screenHeight(0.12, context),
    constraints: BoxConstraints(
      minWidth: 90,
    ),
    decoration: BoxDecoration(
      color: isSelected
          ? category.isExpense
              ? ColorManager.BACKGROUND_LIGHT_RED
              : ColorManager.BACKGROUND_LIGHT_GREEN
          : null,
      border: Border.all(
        color: category.isExpense
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
          SizedBox(
              height: screenHeight(0.01,
                  context)), // Adjust the spacing between the icon and text
          Text(
            category.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: ColorManager.BLACK_VOID,
                fontSize: screenHeight(0.02, context)),
          ), // Replace with your desired text
        ],
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

/// BANNERS ////////////////////////////////////////////////////////////////////

getTwinBanners(
    String title, String subtitle, Color color, double height, double width) {
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
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: ColorManager.DARK_GREY2),
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

getSingleBanner(
    String title, String subtitle, Color color, double height, double width) {
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
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: ColorManager.GREY),
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
