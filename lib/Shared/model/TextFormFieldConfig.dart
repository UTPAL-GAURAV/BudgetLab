import 'package:flutter/material.dart';

import 'callback_model.dart';

class TextFormFieldConfig {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLength;
  final FieldValidator validatorCallback;
  final OnSavedFunction onSavedCallback;
  final void Function(String)? onFieldSubmitted;

  TextFormFieldConfig({
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    required this.maxLength,
    required this.validatorCallback,
    required this.onSavedCallback,
    this.onFieldSubmitted,
  });
}