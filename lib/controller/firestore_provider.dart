import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_place/model/user_model.dart';
import 'package:market_place/service/firestore_service.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreService service = FirestoreService();
  UserModel? currentUser;

  fetchCurrentUser() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await service.firestore
          .collection('user')
          .doc(service.auth.currentUser!.uid)
          .get();
      currentUser = UserModel.fromJson(snapshot.data()!);

      notifyListeners();
      return currentUser;
    } catch (e) {
      throw Exception(e);
    }
  }

  updateUserInfo({
    required String name,
    required String email,
    required String number,
    required String image,
  }) {
    return service.updateProfileInfo(name: name, email: email, number: number,image: image);
  }

  addProfileImage({required String username, required fileimage}) {
    return service.addProfileImage(username: username, fileimage: fileimage);
  }
}
