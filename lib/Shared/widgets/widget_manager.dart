import 'package:budgetlab/Shared/constants_manager.dart';
import 'package:budgetlab/Shared/model/TextFormFieldConfig.dart';
import 'package:budgetlab/Shared/model/callback_model.dart';
import 'package:budgetlab/Shared/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:budgetlab/Shared/helper/validator_helper.dart' as Validator;

import '../color_manager.dart';

/// Global Vars to be used by Widgets //////////////////////////////////////////

/// BUTTONS ////////////////////////////////////////////////////////////////////

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
    decoration: InputDecoration(hintText: config.hintText, labelText: config.labelText),
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
