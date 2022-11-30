import 'package:objectbox/objectbox.dart';

@Entity()
class LoanLend {
  int id;
  bool loan;
  DateTime dateTime;
  int amount;
  String note;
  String phone;
  String returnStatus;

  LoanLend({
    this.id = 0,
    required this.loan,
    required this.dateTime,
    required this.amount,
    this.note = "",
    this.phone = "",
    required this.returnStatus,
  });
}
