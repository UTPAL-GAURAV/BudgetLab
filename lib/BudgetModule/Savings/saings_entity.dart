import 'package:objectbox/objectbox.dart';

@Entity()
class Savings {
  int id;
  String title;
  double targetAmount;
  double savedAmount;
  String icon;

  Savings({
    this.id = 0,
    required this.title,
    required this.targetAmount,
    required this.savedAmount,
    this.icon = ""
  });
}
