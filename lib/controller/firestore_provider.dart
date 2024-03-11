import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_place/model/user_model.dart';
import 'package:market_place/service/firestore_service.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreService service = FirestoreService();
  String? currentUser = '';

  fetchCurrentUser() async {
    try {
      DocumentSnapshot user = await service.firestore
          .collection('user')
          .doc(service.auth.currentUser!.uid)
          .get();
      if (user.exists) {
        currentUser = user.get('name');
        notifyListeners();
      }
      return currentUser;
    } catch (e) {
      throw Exception(e);
    }
  }
}
