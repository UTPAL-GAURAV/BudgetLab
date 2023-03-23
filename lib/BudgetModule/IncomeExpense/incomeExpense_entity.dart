import 'package:objectbox/objectbox.dart';

@Entity()
class IncomeExpense {
  int id;
  bool isIncome;
  DateTime dateTime;
  int amount;
  String note;
  String category;

  IncomeExpense({
    this.id = 0,
    required this.isIncome,
    required this.dateTime,
    required this.amount,
    this.note = "",
    required this.category,
  });
}
