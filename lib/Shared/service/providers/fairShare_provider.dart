
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';

class FairShareProvider with ChangeNotifier {
  final List<Contact> _selectedContacts = [];
  List<Contact> get getSelectedContacts => _selectedContacts;
  void addSelectedContact(Contact contact) {
    _selectedContacts.add(contact);
    notifyListeners();
  }
  void removeSelectedContact(Contact contact) {
    _selectedContacts.remove(contact);
    notifyListeners();
  }
}