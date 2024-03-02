import 'package:objectbox/objectbox.dart';

@Entity()
class History {
  int id;
  int year;
  int month;
  int date;
  int day;
  DateTime dateTime;
  String name;
  double amount;
  bool isIncome;
  // Stores TransactionCategory in case of Loan Lend
  // Else stores Category name in case of Income Expense
  String category;
  String icon;
  List<String> photos;

  History({
    this.id = 0,
    required this.year,
    required this.month,
    required this.date,
    required this.day,
    required this.dateTime,
    this.name = "",
    required this.amount,
    required this.isIncome,
    required this.category,
    required this.icon,
    this.photos = const [],
  });
}
