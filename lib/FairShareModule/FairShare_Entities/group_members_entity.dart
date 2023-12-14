import 'package:objectbox/objectbox.dart';

@Entity()
class GroupMembers {
  int id;
  int groupId;  // FK of Groups
  int friendId;  // FK of Friends

  GroupMembers({
    this.id = 0,
    required this.groupId,
    required this.friendId
  });
}
