import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


/// Public Method //////////////////////////////////////////////////////////////

getCalendar() {
  return const Calendar();
}


/// Widget /////////////////////////////////////////////////////////////////////


class Calendar extends StatefulWidget {
  // const Calendar({Key? key}) : super(key: key);
  const Calendar({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<Calendar> createState() => _CalendarState();
}


class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
         final newSelectedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2023),
          lastDate: DateTime(2100),
        );
         if (newSelectedDate != null) {
           setState(() {
             selectedDate = newSelectedDate;
           });
         }
      },
      child: Text(DateFormat('dd-MM-yyyy').format(selectedDate)),
    );
  }
}

