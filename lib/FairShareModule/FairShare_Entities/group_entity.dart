import 'package:objectbox/objectbox.dart';

@Entity()
class Group {
  int id;
  String name;
  String icon;

  Group({
    this.id = 0,
    this.name = "",
    required this.icon
  });
}
