import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  int selectedContainerIndex = 0;
  int numberOfDaysInPreviousMonth = 1;
  int currentDay = 1;
  List<int> dayList = [];

  @override
  void initState() {
    super.initState();
    numberOfDaysInPreviousMonth =
        getDaysInMonth(DateTime.now().year, DateTime.now().month + 1);
    currentDay = DateTime.now().day;
    dayList.add(currentDay);
    for (int i = 1; i < 7; i++) {
      currentDay--;
      if (currentDay == 0) {
        currentDay = numberOfDaysInPreviousMonth;
      }
      dayList.add(currentDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Now you can use dayList and other variables in your widget's build method
    return Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            DateTime customDate = DateTime(
                DateTime.now().year, DateTime.now().month, dayList[index]);
            String formattedDay = DateFormat.EEEE()
                .format(customDate)
                .substring(0, 3)
                .toUpperCase();
            bool isSelected = selectedContainerIndex == index;

            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4.0,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedContainerIndex =
                        index; // Update the selected index.
                  });
                },
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      formattedDay,
                      style: TextStyle(
                          fontSize: 18,
                          color: isSelected ? Colors.white : Colors.grey),
                    ),
                    Text(
                      dayList[index].toString(),
                      style: TextStyle(
                          fontSize: 18,
                          color: isSelected ? Colors.white : Colors.grey),
                    ),
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
        ));
  }
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableMonths extends StatefulWidget {
  const ScrollableMonths({Key? key}) : super(key: key);

  @override
  State<ScrollableMonths> createState() => _ScrollableMonthsState();
}

class _ScrollableMonthsState extends State<ScrollableMonths> {
  int selectedContainerIndex = 0;
  int currentMonth = 1;
  List<int> monthList = [];

  @override
  void initState() {
    currentMonth = DateTime.now().month;
    monthList.add(currentMonth);
    for (int i = 1; i <= 11; i++) {
      currentMonth--;
      if (currentMonth == 0) {
        currentMonth = 12;
      }
      monthList.add(currentMonth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 12,
          itemBuilder: (context, index) {
            final DateTime dateTime =
                DateTime(DateTime.now().year, monthList[index], 1);
            final String monthAbbreviation =
                DateFormat('MMM').format(dateTime).toUpperCase();
            bool isSelected = selectedContainerIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedContainerIndex = index; // Update the selected index.
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      monthAbbreviation,
                      style: TextStyle(
                          fontSize: 18,
                          color: isSelected ? Colors.white : Colors.grey),
                    ),
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
        ));
  }
}

/// Widget /////////////////////////////////////////////////////////////////////

class ScrollableYears extends StatefulWidget {
  const ScrollableYears({Key? key}) : super(key: key);

  @override
  State<ScrollableYears> createState() => _ScrollableYearsState();
}

class _ScrollableYearsState extends State<ScrollableYears> {
  int selectedContainerIndex = 0;
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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: yearList.length,
          itemBuilder: (context, index) {
            bool isSelected = selectedContainerIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedContainerIndex = index; // Update the selected index.
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                child: Center(
                    child: Column(
                  children: [
                    Text(
                      yearList[index].toString(),
                      style: TextStyle(
                          fontSize: 18,
                          color: isSelected ? Colors.white : Colors.grey),
                    ),
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
        ));
  }
}
