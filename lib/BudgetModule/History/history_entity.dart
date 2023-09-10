import 'package:objectbox/objectbox.dart';

@Entity()
class History {
  int id;
  int year;
  int month;
  int date;
  int day;
  String title;
  int amount;
  bool isIncome;
  String category;

  History({
    this.id = 0,
    required this.year,
    required this.month,
    required this.date,
    required this.day,
    required this.title,
    required this.amount,
    required this.isIncome,
    required this.category
  });
}
