import 'package:flutter/cupertino.dart';

class HistoryScrollableDateProvider with ChangeNotifier {
  int _selectedContainerIndex = 0;
  int get selectedContainerIndex => _selectedContainerIndex;
  void setSelectedContainerIndex(int index) {
    _selectedContainerIndex = index;
    notifyListeners();
  }

  int _selectedYear = DateTime.now().year;
  int get selectedYear => _selectedYear;
  void setSelectedYear(int year) {
    _selectedYear = year;
    notifyListeners();
  }

  int _selectedMonth = DateTime.now().month;
  int get selectedMonth => _selectedMonth;
  void setSelectedMonth(int month) {
    _selectedMonth = month;
    notifyListeners();
  }

  int _selectedDate = DateTime.now().day;
  int get selectedDate => _selectedDate;
  void setSelectedDate(int date) {
    _selectedDate = date;
    notifyListeners();
  }
}
