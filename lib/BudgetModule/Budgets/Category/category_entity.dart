import 'package:objectbox/objectbox.dart';

@Entity()
class Category {
  int id;
  String transactionType;  // Income, Expense, Investment
  String name;  // Unique
  String icon;
  bool isCap;
  String cycle; //repeats
  double cycleBudget;
  bool addToNextCycle;
  double currentCycleAmountLeft;
  double totalCycleAmount;
  double totalAmountSpent;

  Category({
    this.id = 0,
    required this.transactionType,
    required this.name,
    required this.icon,
    required this.isCap,
    required this.cycle,
    required this.cycleBudget,
    required this.addToNextCycle,
    required this.currentCycleAmountLeft,
    required this.totalCycleAmount,
    required this.totalAmountSpent
  });
}
