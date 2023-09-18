import 'package:budgetlab/HomeModule/UI/homePage_screen.dart';
import 'package:budgetlab/Shared/color_manager.dart';
import 'package:budgetlab/Shared/service/providers/historyScrollable_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../BudgetModule/History/UI/history_screen.dart';

/// Public Method //////////////////////////////////////////////////////////////

getHistoryDateScrollableFormat(int formatNumber) {
  if (formatNumber == 0) {
    return ScrollableDates();
  } else if (formatNumber == 1) {
    return ScrollableMonths();
  } else if (formatNumber == 2) {
    return ScrollableYears();
  }
}

int getDaysInMonth(int year, int month) {
  if (month == DateTime.february) {
    final bool isLeapYear =
        (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
    return isLeapYear ? 29 : 28;
  }
  const List<int> daysInMonth = <int>[
    31,
    -1,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];
  return daysInMonth[month - 1];
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableDates extends StatefulWidget {
  const ScrollableDates({Key? key}) : super(key: key);

  @override
  State<ScrollableDates> createState() => _ScrollableDatesState();
}

class _ScrollableDatesState extends State<ScrollableDates> {
  late int numberOfDaysInPreviousMonth;
  // Define extra var & array for Month and Year
  // 3 parallel lists for edge cases like: new month / new year
  int currentDate = DateTime.now().day;
  List<int> dateList = [];
  int currentMonth = DateTime.now().month;
  List<int> monthList = [];
  int currentYear = DateTime.now().year;
  List<int> yearList = [];

  @override
  void initState() {
    super.initState();
    // Get numberOfDaysInPreviousMonth for reverse date count
    numberOfDaysInPreviousMonth = getDaysInMonth(currentYear, currentMonth - 1);
    // Set all 7 dates in reverse order while setting their month & year also for edge cases
    for (int i = 0; i < 7; i++) {
      // If currentDate is 0 then it means we have to now get values from previous month
      if (currentDate == 0) {
        currentDate = numberOfDaysInPreviousMonth;
        currentMonth = DateTime.now().month - 1;
        // If currentMonth is 12 then it means we have to now get values from previous year
        // as January - 1 = December i.e. 12
        if (currentMonth == 12) {
          currentYear = DateTime.now().year - 1;
        }
      }
      dateList.add(currentDate);
      monthList.add(currentMonth);
      yearList.add(currentYear);
      currentDate--;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Now you can use dayList and other variables in your widget's build method
    return Container(
        height: 100,
        child: Consumer<HistoryScrollableDateProvider>(
            builder: (context, provider, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              DateTime customDate = DateTime(
                  DateTime.now().year, DateTime.now().month, dateList[index]);
              String formattedDay = DateFormat.EEEE()
                  .format(customDate)
                  .substring(0, 3)
                  .toUpperCase();
              bool isSelected = provider.selectedContainerIndex == index;

              return GestureDetector(
                onTap: () {
                  // To set dot and highlight date/day
                  provider.setSelectedContainerIndex(index);
                  // Set date, month and year to show transactions
                  provider.setSelectedDate(dateList[index]);
                  provider.setSelectedMonth(monthList[index]);
                  provider.setSelectedYear(yearList[index]);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: _getScrollableContainersWidth(context),
                    vertical: _getScrollableContainersHeight(context),
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        formattedDay,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.grey),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, screenHeight(0.01, context), 0, 0)),
                      Text(
                        dateList[index].toString(),
                        style: TextStyle(
                            fontSize: 18,
                            color: isSelected ? Colors.white : Colors.grey),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, screenHeight(0.01, context), 0, 0)),
                      if (isSelected)
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: ColorManager.HOT_CORAL,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  )),
                ),
              );
            },
          );
        }));
  }
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableMonths extends StatefulWidget {
  const ScrollableMonths({Key? key}) : super(key: key);

  @override
  State<ScrollableMonths> createState() => _ScrollableMonthsState();
}

class _ScrollableMonthsState extends State<ScrollableMonths> {
  // Define extra var & array for Year
  // 2 parallel lists for case like: new year
  int currentMonth = DateTime.now().month;
  List<int> monthList = [];
  int currentYear = DateTime.now().year;
  List<int> yearList = [];

  @override
  void initState() {
    for (int i = 0; i < 12; i++) {
      // If currentMonth is 0 then it means we have to now get values from previous year
      if (currentMonth == 0) {
        currentMonth = 12;
        // If currentMonth is 12 then it means we have to now get values from previous year
        // as January - 1 = December i.e. 12
        currentYear = DateTime.now().year - 1;
      }
      monthList.add(currentMonth);
      yearList.add(currentYear);
      currentMonth--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Consumer<HistoryScrollableDateProvider>(
            builder: (context, provider, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 12,
            itemBuilder: (context, index) {
              final DateTime dateTime =
                  DateTime(DateTime.now().year, monthList[index], 1);
              final String monthAbbreviation =
                  DateFormat('MMM').format(dateTime).toUpperCase();
              bool isSelected = provider.selectedContainerIndex == index;

              return GestureDetector(
                onTap: () {
                  // To set dot and highlight date/day
                  provider.setSelectedContainerIndex(index);
                  // Set date, month and year to show transactions
                  // Set date to 0, as we want to see all transactions of that month
                  provider.setSelectedDate(0);
                  provider.setSelectedMonth(monthList[index]);
                  provider.setSelectedYear(yearList[index]);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: _getScrollableContainersWidth(context),
                    vertical: _getScrollableContainersHeight(context),
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        monthAbbreviation,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.grey),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, screenHeight(0.01, context), 0, 0)),
                      Text(
                        yearList[index].toString(),
                        style: TextStyle(
                            fontSize: 12,
                            color: isSelected ? Colors.white : Colors.grey),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, screenHeight(0.018, context), 0, 0)),
                      if (isSelected)
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  )),
                ),
              );
            },
          );
        }));
  }
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableYears extends StatefulWidget {
  const ScrollableYears({Key? key}) : super(key: key);

  @override
  State<ScrollableYears> createState() => _ScrollableYearsState();
}

class _ScrollableYearsState extends State<ScrollableYears> {
  Set<int> distinctYearsSet = <int>{};
  List<int> yearList = [];
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    distinctYearsSet = await historyService.getAllDistinctYears();
    yearList = distinctYearsSet.toList();
    if (yearList.isEmpty) {
      yearList.add(DateTime.now().year);
    } else {
      yearList.sort((a, b) => b.compareTo(a));
    }
    setState(() {
      isDataLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isDataLoaded) {
      // If data is not yet loaded, return a loading indicator.
      return CircularProgressIndicator();
    }

    return Container(
        height: 100,
        child: Consumer<HistoryScrollableDateProvider>(
            builder: (context, provider, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: yearList.length,
            itemBuilder: (context, index) {
              bool isSelected = provider.selectedContainerIndex == index;
              return GestureDetector(
                onTap: () {
                  // To set dot and highlight date/day
                  provider.setSelectedContainerIndex(index);
                  // Set date, month and year to show transactions
                  // Set date & month to 0, as we want to see all transactions of that year
                  provider.setSelectedDate(0);
                  provider.setSelectedMonth(0);
                  provider.setSelectedYear(yearList[index]);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: _getScrollableContainersWidth(context),
                    vertical: _getScrollableContainersHeight(context),
                  ),
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        yearList[index].toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.grey),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, screenHeight(0.04, context), 0, 0)),
                      if (isSelected)
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  )),
                ),
              );
            },
          );
        }));
  }
}

_getScrollableContainersWidth(BuildContext context) {
  return screenWidth(0.04, context);
}

_getScrollableContainersHeight(BuildContext context) {
  return  screenHeight(0.01, context);
}
