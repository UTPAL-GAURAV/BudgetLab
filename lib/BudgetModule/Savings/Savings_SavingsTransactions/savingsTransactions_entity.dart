import 'package:objectbox/objectbox.dart';

@Entity()
class SavingsTransactions {
  int id;
  int savingsId;
  double amount;
  DateTime dateTime;
  String notes;

  SavingsTransactions({
    this.id = 0,
    required this.savingsId,
    required this.amount,
    required this.dateTime,
    this.notes = '',
  });
}
