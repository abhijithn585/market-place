import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/model/product_model.dart';
import 'package:market_place/model/user_model.dart';
import 'package:market_place/service/firestore_service.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreService service = FirestoreService();
  List<ProductModel> productList = [];
  List<String> categoryList = [];
  UserModel? currentUser;

  fetchCurrentUser() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await service.firestore
          .collection('user')
          .doc(service.auth.currentUser!.uid)
          .get();
      currentUser = UserModel.fromJson(snapshot.data()!);
      return currentUser;
    } catch (e) {
      throw Exception(e);
    }
  }

  fetchAllCategory() {
    try {
      service.firestore.collection('products').snapshots().listen((product) {
        categoryList = product.docs
            .map((doc) => ProductModel.fromJson(doc.data()).category!)
            .toSet()
            .toList();
        notifyListeners();
      });
    } catch (e) {
      throw Exception();
    }
  }

  List<ProductModel> fetchProductsByCategory({required String category}) {
    try {
      productList.clear();
      service.firestore.collection('products').snapshots().listen((product) {
        productList = product.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList();
        notifyListeners();
      });
      return productList;
    } catch (e) {
      throw Exception();
    }
  }

  updateUserInfo({
    required String name,
    required String email,
    required String number,
    required String image,
  }) {
    return service.updateProfileInfo(
        name: name, email: email, number: number, image: image);
  }

  addProfileImage({required String username, required fileimage}) {
    return service.addProfileImage(username: username, fileimage: fileimage);
  }

  addProduct(
      {required ProductModel product,
      required String name,
      required String uid}) {
    return service.addProduct(product, name, uid);
  }
}
