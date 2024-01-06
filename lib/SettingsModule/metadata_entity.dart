import 'package:objectbox/objectbox.dart';

@Entity()
class Metadata {
  int id;
  double currentBalance;
  double yourWorth;
  String userName;
  bool gender;
  String language;
  String currency;
  String country;
  int countryCode;
  String password;
  bool hideOn;
  bool readMessage;

  Metadata({
    this.id = 0,
    this.currentBalance = 0,
    this.yourWorth = 0,
    this.userName = "Hello User",
    this.gender = false,
    this.language = "EN",
    this.currency = "USD",
    this.country = "",
    this.countryCode = 0,
    this.password = "",
    this.hideOn = false,
    this.readMessage = false,
  });
}
