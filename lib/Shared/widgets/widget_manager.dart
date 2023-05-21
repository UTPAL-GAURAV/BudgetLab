import 'package:budgetlab/Shared/constants_manager.dart';
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


getTextFormField(String labelText, String hintText, TextInputType keyboardType, int maxLength, FieldValidator validatorCallback, OnSavedFunction onSavedCallback) {
  return TextFormField(
    decoration: InputDecoration(hintText: hintText, labelText: labelText),
    keyboardType: keyboardType,
    maxLength: maxLength,
    validator: (value) {
      String response = validatorCallback(value!);
      return response.isNotEmpty ? response : null;
    },
    onSaved: onSavedCallback,
  );
}
