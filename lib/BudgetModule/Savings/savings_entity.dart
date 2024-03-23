import 'package:objectbox/objectbox.dart';

@Entity()
class Savings {
  int id;
  @Unique()
  String title;   //Unique
  double targetAmount;
  double savedAmount;
  String icon;
  DateTime targetDateTime;
  DateTime startDateTime;

  Savings({
    this.id = 0,
    required this.title,
    required this.targetAmount,
    required this.savedAmount,
    this.icon = 'assets/images/icons/save.png',
    required this.targetDateTime,
    required this.startDateTime,
  });
}
