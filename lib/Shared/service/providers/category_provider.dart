
import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../enums_manager.dart';


class CategoryProvider extends ChangeNotifier {
  String _uploadedImage = 'assets/images/icons/budgetCategory/piggy.png';
  String get uploadedImage => _uploadedImage;
  void setUploadedImage(String uploadedImage) {
    _uploadedImage = uploadedImage;
    notifyListeners();
  }

  int _selectedIcon = -1;
  int get selectedIcon => _selectedIcon;
  void setSelectedIcon(int selectedIcon) {
    _selectedIcon = selectedIcon;
    notifyListeners();
  }

  TransactionType _selectedTransactionType = TransactionType.expense;
  TransactionType get selectedTransactionType => _selectedTransactionType;
  void setSelectedTransactionType(TransactionType selectedTransactionType) {
    _selectedTransactionType = selectedTransactionType;
    notifyListeners();
  }

  BudgetCycle _selectedBudgetCycle = BudgetCycle.Monthly;
  BudgetCycle get selectedBudgetCycle => _selectedBudgetCycle;
  void setSelectedBudgetCycle(BudgetCycle selectedBudgetCycle) {
    _selectedBudgetCycle = selectedBudgetCycle;
    notifyListeners();
  }
}