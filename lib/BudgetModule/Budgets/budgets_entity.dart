import 'package:objectbox/objectbox.dart';

@Entity()
class Budgets {
  int id;
  bool income;
  int amount;
  int repeatingAmount;
  String note;
  String repeats;
  String icon;

  Budgets({
    this.id = 0,
    required this.income,
    required this.amount,
    required this.repeatingAmount,
    this.note = "",
    required this.repeats,
    this.icon = "",
  });
}
