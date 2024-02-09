import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../HomeModule/UI/homePage_screen.dart';
import '../../Shared/color_manager.dart';
import '../../Shared/service/providers/fairShare_provider.dart';

/// Public Method //////////////////////////////////////////////////////////////
getAddFromContactsBody() {
  return AddFromContactBody();
}

/// Widget /////////////////////////////////////////////////////////////////////
class AddFromContactBody extends StatefulWidget {
  const AddFromContactBody({Key? key}) : super(key: key);

  @override
  State<AddFromContactBody> createState() => _AddFromContactBodyState();
}

class _AddFromContactBodyState extends State<AddFromContactBody> {
  bool isContactsVisible = false;
  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  TextEditingController contactsSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getAllContacts();
    contactsSearchController.addListener(() {
      _filterContacts();
    });
  }

  _getAllContacts() async {
    // First get permission to access contacts
    Map<Permission, PermissionStatus> statuses = await [
      Permission.contacts,
    ].request();
    if (statuses[Permission.contacts]!.isGranted) {
      List<Contact> _contacts = await ContactsService.getContacts();
      setState(() {
        contacts = _contacts;
      });
    }
  }

  _filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (contactsSearchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = contactsSearchController.text.toLowerCase();
        String contactName = contact.displayName!.toLowerCase();
        return contactName.contains(searchTerm);
      });

      // Will force UI to rebuild with new filtered contact list
      setState(() {
        contactsFiltered = _contacts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSearchingContact = contactsSearchController.text.isNotEmpty;
    return Consumer<FairShareProvider>(builder: (context, provider, child) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(screenWidth(0.02, context), 10, screenWidth(0.02, context), 0),
            child: Wrap(
              spacing: 8.0, // Spacing between child containers
              runSpacing: 8.0, // Spacing between lines of child containers
              children: [
                ...provider.getSelectedContacts
                    .map((contact) => _buildSelectedContactsContainer(context, contact, provider))
                    .toList(),
                TextFormField(
                  onTap: () {
                    isContactsVisible = true;
                  },
                  decoration: InputDecoration(
                    hintText: " Enter name",
                    labelText: " Search contacts",
                  ),
                  keyboardType: TextInputType.text,
                  maxLength: 16,
                  controller: contactsSearchController,
                ),
              ],
            ),
          ),
          Visibility(
            visible: isContactsVisible,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: isSearchingContact == true ? contactsFiltered.length : contacts.length,
                itemBuilder: (context, index) {
                  Contact contact= isSearchingContact == true ? contactsFiltered[index] : contacts[index];
                  if (!provider.getSelectedContacts.contains(contact)) {
                    return ListTile(
                      onTap: () {
                        isContactsVisible = false;
                        provider.addSelectedContact(contact);
                        contactsSearchController.text = "";
                      },
                      leading: CircleAvatar(
                        backgroundImage: (contact.avatar != null && contact.avatar!.isNotEmpty)
                            ? MemoryImage(contact.avatar!)
                            : null, // No MemoryImage for initials
                        child: (contact.avatar == null || contact.avatar!.isEmpty)
                            ? Text(
                                contact.initials(),
                                style: TextStyle(color: Colors.white),
                              )
                            : null,
                      ),
                      title: Text(contact.displayName ?? ""),
                      subtitle:
                          Text(contact.phones?.isNotEmpty == true ? contact.phones!.elementAt(0).value ?? "" : ""),
                    );
                  }
                }),
          ),
        ],
      );
    });
  }
}

// Function to build a container for each animal name
Widget _buildSelectedContactsContainer(BuildContext context, Contact contact, FairShareProvider provider) {
  return GestureDetector(
    onTap: () {
      _showRemoveContactSlideUpWidget(context, contact, provider);
    },
    onDoubleTap: () {
      provider.removeSelectedContact(contact);
    },
    child: Container(
      padding: EdgeInsets.all(8.0), // Padding around each child container
      decoration: BoxDecoration(
        color: Colors.blue, // Example child container color
        borderRadius: BorderRadius.circular(16.0), // Curved border radius
      ),
      child: Text(
        contact.displayName!,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

void _showRemoveContactSlideUpWidget(BuildContext context, Contact contact, FairShareProvider provider) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 80,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: [
            Container(
              height: 6,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 18)),
            GestureDetector(
              onTap: () {
                provider.removeSelectedContact(contact);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: ColorManager.CHILLY_PEPPER,
                  ),
                  Text(
                    "  Remove ${contact.displayName} from expense ",
                    style: TextStyle(
                        color: ColorManager.CHILLY_PEPPER,
                        fontSize: screenHeight(0.018, context),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
