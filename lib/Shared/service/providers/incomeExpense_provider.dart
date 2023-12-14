
import 'package:flutter/cupertino.dart';

import '../../enums_manager.dart';

class IncomeExpenseProvider extends ChangeNotifier {
  TransactionType _transactionType = TransactionType.expense;
  TransactionType get transactionType => _transactionType;
  void setTransactionType(TransactionType transactionType) {
    _transactionType = transactionType;
    notifyListeners();
  }

  int _selectedCategory = -1;
  int get selectedCategory => _selectedCategory;
  void setSelectedCategory(int category) {
    _selectedCategory = category;
    notifyListeners();
  }

  late String _selectedIcon;
  String get selectedIcon => _selectedIcon;
  void setSelectedIcon(String icon) {
    _selectedIcon = icon;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}