import 'package:objectbox/objectbox.dart';

@Entity()
class BudgetsExpences {
  int id;
  int amount;
  DateTime dateTime;
  String note;
  String image;

  BudgetsExpences({
    this.id = 0,
    required this.amount,
    required this.dateTime,
    this.note = "",
    this.image = "",
  });
}
