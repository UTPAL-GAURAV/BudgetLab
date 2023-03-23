import 'package:objectbox/objectbox.dart';

@Entity()
class Budget {
  int id;
  String repeats;
  int amount;

  Budget({
    this.id = 0,
    required this.repeats,
    required this.amount,
  });
}
