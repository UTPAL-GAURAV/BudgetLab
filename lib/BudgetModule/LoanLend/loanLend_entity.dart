import 'package:objectbox/objectbox.dart';

@Entity()
class LoanLend {
  int id;
  bool isLoan;
  DateTime dateTime;
  DateTime dateOfReturn;
  int amount;
  String name;
  String note;
  String phone;
  String returnStatus;
  String genderEmoji;

  LoanLend({
    this.id = 0,
    required this.isLoan,
    required this.dateTime,
    required this.dateOfReturn,
    required this.amount,
    required this.name,
    this.note = "",
    this.phone = "",
    required this.returnStatus,
    this.genderEmoji = ""
  });
}
