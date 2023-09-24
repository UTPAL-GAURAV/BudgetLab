import 'package:objectbox/objectbox.dart';

@Entity()
class CycleSavings {
  int id;
  String categoryName; // FK, Unique
  String cycleName; // eg: Jan, Feb
  double cycleAmount;
  double savings;

  CycleSavings({
    this.id = 0,
    required this.categoryName,
    required this.cycleName,
    required this.cycleAmount,
    required this.savings,
  });
}