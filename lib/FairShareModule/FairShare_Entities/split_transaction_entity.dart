import 'package:objectbox/objectbox.dart';

@Entity()
class SplitTransaction {
  int id;
  String transactionId; // FK of Transactions
  String friendId; // Friend who needs to pay to the friend who contributed. // FK of Friends
  double amount;

  SplitTransaction({
    this.id = 0,
    required this.transactionId,
    required this.friendId,
    required this.amount
  });
}
