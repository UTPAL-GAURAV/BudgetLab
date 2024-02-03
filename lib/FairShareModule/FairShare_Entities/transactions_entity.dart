import 'package:objectbox/objectbox.dart';

@Entity()
class Transactions {
  int id;
  DateTime dateTime;
  String name;
  String friendId; // Friend who contributed  // FK of Friends
  String groupId;  // FK of Groups
  double amount;
  List<String> photos;

  Transactions({
    this.id = 0,
    required this.dateTime,
    this.name = "",
    required this.friendId,
    required this.groupId,
    required this.amount,
    this.photos = const [],
  });
}
