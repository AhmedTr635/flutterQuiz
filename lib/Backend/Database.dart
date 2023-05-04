import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizzapp2/Models/UserEnAttente.dart';

class DatabaseService {
  final CollectionReference UserEnAttenteCollection =
      FirebaseFirestore.instance.collection('UsersEnAttente');

  Future<bool> addUsersEnAttenteToDb(UserEnAttente userEnAttente) async {
    try {
      await UserEnAttenteCollection.doc()
          .set(userEnAttente.toMap(userEnAttente));
      return true;
    } catch (e) {
      return false;
    }
  }
}
