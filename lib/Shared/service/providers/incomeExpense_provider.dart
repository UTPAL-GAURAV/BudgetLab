
import 'package:flutter/cupertino.dart';

class IncomeExpenseProvider extends ChangeNotifier {
  bool _isIncome = false;
  bool get isIncome => _isIncome;
  void setIsIncome(bool isIncome) {
    _isIncome = isIncome;
    notifyListeners();
  }

  int _selectedCategory = -1;
  int get selectedCategory => _selectedCategory;
  void setSelectedCategory(int category) {
    _selectedCategory = category;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }
}