import 'package:objectbox/objectbox.dart';

@Entity()
class Category {
  int id;
  bool isExpense;
  String name;
  String icon;

  Category({
    this.id = 0,
    required this.isExpense,
    required this.name,
    this.icon = "",
  });
}
