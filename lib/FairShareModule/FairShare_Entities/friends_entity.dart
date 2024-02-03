import 'package:objectbox/objectbox.dart';

@Entity()
class Friends {
  int id;
  String userUniqueId;   // To identify user globally (email)
  String name;
  String icon;
  String phoneNumber;

  Friends({
    this.id = 0,
    this.userUniqueId = "",
    this.name = "",
    required this.icon,
    this.phoneNumber = ""
  });
}
