import 'package:objectbox/objectbox.dart';

@Entity()
class Transactions {
  int id;
  DateTime dateTime;
  String friendId; // Friend who contributed  // FK of Friends
  String groupId;  // FK of Groups
  double amount;

  Transactions({
    this.id = 0,
    required this.dateTime,
    required this.friendId,
    required this.groupId,
    required this.amount
  });
}
