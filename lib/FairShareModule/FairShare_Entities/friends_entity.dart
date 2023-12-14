import 'package:objectbox/objectbox.dart';

@Entity()
class Friends {
  int id;
  String name;
  String icon;

  Friends({
    this.id = 0,
    this.name = "",
    required this.icon
  });
}
