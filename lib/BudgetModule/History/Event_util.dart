import 'dart:io';

import 'package:budgetlab/BudgetModule/LoanLend/loanLend_controller.dart';
import 'package:budgetlab/BudgetModule/LoanLend/loanLend_entity.dart';
import 'package:objectbox/objectbox.dart';
import '../../objectbox.g.dart';
import '../IncomeExpense/incomeExpense_controller.dart';
import '../IncomeExpense/incomeExpense_entity.dart';
import 'UI/Event_entity.dart';
import '../../DB/ObjectBoxManager.dart';

class Events {

  static Box incomeExpenseBox = ObjectBoxManager.incomeExpenseBox;
  static Box loanLendBox = ObjectBoxManager.loanLendBox;

  static List<Event> getCombinedEvents() {
    IncomeExpenseController incomeExpense = IncomeExpenseController();
    LoanLendController loanLend = LoanLendController();

    List<IncomeExpense> incomeEvents = incomeExpense.getAllIncomeExpenseList();
    List<LoanLend> loanEvents = loanLend.getAllLoanLendList();
    // Event event = Event(title: "", category: "", amount: 0, date: DateTime.now(), color: true);
    List<Event> events = [];

    for (final ie in incomeEvents) {
      var category;
      var color;
      if (ie.isIncome == true) {
        category = "Income";
        color = true;
      } else {
        category = "Expense";
        color = false;
      }
      events.add(Event(
          title: ie.category,
          date: ie.dateTime,
          amount: ie.amount,
          category: category,
          color: color
      ));
    }

    for (final ll in loanEvents) {
      var category;
      var color;
      if (ll.isLoan == true) {
        category = "Loan";
        color = false;
      } else {
        category = "Lend";
        color = true;
      }
      events.add(Event(
          title: ll.name,
          date: ll.dateTime,
          amount: ll.amount,
          category: category,
          color: color
      ));
    }

    print('combined: $events');


    return events;
  }

  static List<Event> filterDayEvent(DateTime date) {
    print('date for filter day event: $date');

    DateTime startOfDay = DateTime(
      date.year,
      date.month,
      date.day,
    );

    DateTime endOfDay = DateTime(
      date.year,
      date.month,
      date.day,
      23,
      59,
      59,
    );
    List<Event> events = getCombinedEvents();
    List<Event> filteredEvents = events.where((obj) => obj.date.isAfter(startOfDay) && obj.date.isBefore(endOfDay)).toList();
    print('in filterDayEvent:  $events');
    print('Filtered Events: $filteredEvents');

    return filteredEvents;
  }

  static List<Event> filterEvent(DateTime startDate, DateTime endDate) {
    print(startDate);
    List<Event> events = getCombinedEvents();
    List<Event> filteredEvents = events.where((obj) =>
    obj.date.isAfter(startDate) && obj.date.isBefore(endDate)).toList();
    print(events);
    print(filteredEvents);

    return filteredEvents;
  }
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

List<DateTime> daysInRange(DateTime first, DateTime last) {
  print(first);
  print(last);
  final dayCount = last
      .difference(first)
      .inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

List<Event> eventList = Events.getCombinedEvents();

int getHashCode(DateTime key) {
  stderr.writeln('print me');
  for (int i = 0; i < eventList.length; i++) {
    print(eventList[i]);
  }
  return key.day * 1000000 + key.month * 10000 + key.year;
}
