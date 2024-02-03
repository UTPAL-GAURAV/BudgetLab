import 'package:objectbox/objectbox.dart';
import 'package:uuid/uuid.dart';

@Entity()
class Group {
  int id;
  String groupUniqueId;   // To identify the group globally (uuid)
  String name;
  String icon;
  bool isGroup; // Is Group or Individual
  double amountStatus;  // Used to display Group/Individual summary. =0 means settled, <0 means you owe (red), >0 means you are owed (green)

  Group({
    this.id = 0,
    required this.groupUniqueId,
    this.name = "",
    required this.icon,
    required this.isGroup,
    this.amountStatus = 0,
  });
}
