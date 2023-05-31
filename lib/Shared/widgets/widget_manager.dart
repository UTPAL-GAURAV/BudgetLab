import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:budgetlab/Shared/model/TextFormFieldConfig.dart';
import 'package:budgetlab/Shared/model/callback_model.dart';
import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../color_manager.dart';

/// Global Vars to be used by Widgets //////////////////////////////////////////

/// BUTTONS ////////////////////////////////////////////////////////////////////
getIconButtons(String icon, String label) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.blue, // Set the border color
        width: 1.0, // Set the border width
      ),
      borderRadius: BorderRadius.circular(8), // Set the border radius
    ),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            fit: BoxFit.fill,
            height: 50,
            width: 50,
          ), // Replace with your desired icon
          const SizedBox(
              height: 8), // Adjust the spacing between the icon and text
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ), // Replace with your desired text
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

getTextFormField(TextFormFieldConfig config) {
  return TextFormField(
    decoration:
        InputDecoration(hintText: config.hintText, labelText: config.labelText),
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

getBanners(String title, String subtitle, String color, double height, double width) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.blue[200],
      borderRadius: BorderRadius.circular(20),
    ),
    child: SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          Text(subtitle)
        ],
      ),
    ),
  );
}