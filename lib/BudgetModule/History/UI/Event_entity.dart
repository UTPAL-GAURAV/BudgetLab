import 'package:objectbox/objectbox.dart';

@Entity()
class Event {
  String title;
  String category;
  int amount;
  DateTime date;
  bool color;

  Event(
      {
        required this.title,
        required this.category,
        required this.amount,
        required this.date,
        required this.color
      });

  @override
  String toString() {
    return 'Event{title: $title, category: $category, amount: $amount, date: $date, color: $color}';
  }
}
