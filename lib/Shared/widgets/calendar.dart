import 'package:budgetlab/Shared/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../HomeModule/UI/homePage_screen.dart';

/// Public Method //////////////////////////////////////////////////////////////

getCalendar(updateValueOnPressedCallback) {
  return Calendar(
    updateValueOnPressed: updateValueOnPressedCallback,
  );
}

/// Widget /////////////////////////////////////////////////////////////////////

class Calendar extends StatefulWidget {
  // const Calendar({Key? key}) : super(key: key);
  Calendar({super.key, this.restorationId, required this.updateValueOnPressed});

  final Function(DateTime) updateValueOnPressed;

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
        widget.updateValueOnPressed(selectedDate);
      },
      child: Text(
        DateFormat('dd-MM-yyyy').format(selectedDate),
        style: TextStyle(fontSize: screenHeight(0.02, context), color: ColorManager.PRIMARY_BLUE),
      ),
    );
  }
}
