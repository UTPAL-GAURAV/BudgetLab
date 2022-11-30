import 'package:objectbox/objectbox.dart';

@Entity()
class IncomeExpense {
  int id;
  bool income;
  DateTime dateTime;
  int amount;
  String note;

  IncomeExpense({
    this.id = 0,
    required this.income,
    required this.dateTime,
    required this.amount,
    this.note = "",
  });
}
