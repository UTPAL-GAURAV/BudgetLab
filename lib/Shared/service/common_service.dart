import 'package:flutter/material.dart';

height(double num, BuildContext context) {
  return MediaQuery.of(context).size.height * num;
}

width(double num, BuildContext context) {
  return MediaQuery.of(context).size.width * num;
}