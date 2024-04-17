import 'package:chit_chat/common/utils/utils.dart';
import 'package:chit_chat/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectContactsRepositoryProvider = Provider(
  (ref) => SelectContactRepository(
    firestore: FirebaseFirestore.instance,
  ),
);

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({
    required this.firestore,
  });

  Future<List<Contact>> getContacts () async {
    List<Contact> contacts = [];
    try {
      if(await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async {
    try {
      var userCollection = await firestore.collection('user').get();
      bool isFound = false;

      for(var document in userCollection.docs) {
        var userData = UserModel.fromMap(document.data());
        print(selectedContact.phones[0].number);
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}