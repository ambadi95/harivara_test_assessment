import 'package:contacts_service/contacts_service.dart';

abstract class GetContacts {
  Future<List<Contact>> getContacts();
}

class GetContactsImpl extends GetContacts {
  @override
  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = await ContactsService.getContacts();
    return contacts;
  }
}
