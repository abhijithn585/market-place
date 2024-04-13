import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/model/chat_model.dart';
import 'package:market_place/model/product_model.dart';
import 'package:market_place/model/user_model.dart';
import 'package:market_place/service/firestore_service.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreService service = FirestoreService();
  List<ProductModel> productList = [];
  List<ProductModel> favoraits = [];
  List<ProductModel> userProductList = [];
  List<String> categoryList = [];
  List<ChatModel> messages = [];
  String? selectedCategory;
  UserModel? currentUser;
  String searchQuery = '';

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

  getUserName() async {
    try {
      await service.firestore.collection('user').get();
      notifyListeners();
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
      service.firestore
          .collection('products')
          .where('category', isEqualTo: category)
          .snapshots()
          .listen((product) {
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

  List<ProductModel> fetchProducts() {
    try {
      if (searchQuery.isNotEmpty) {
        service.firestore.collection('products').snapshots().listen((product) {
          productList = product.docs
              .map((doc) => ProductModel.fromJson(doc.data()))
              .where((ProductModel product) => product.name!
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()))
              .toList();
          notifyListeners();
        });
        return productList;
      } else {
        service.firestore.collection('products').snapshots().listen((product) {
          productList = product.docs
              .map((doc) => ProductModel.fromJson(doc.data()))
              .toList();
          notifyListeners();
        });
        return productList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  List<ProductModel> fetchUserProduct() {
    try {
      service.firestore
          .collection('user')
          .doc(service.auth.currentUser!.uid)
          .collection('products')
          .snapshots()
          .listen((product) {
        userProductList = product.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList();
        notifyListeners();
      });
      return userProductList;
    } catch (e) {
      throw Exception(e);
    }
  }

  searchProducts(String query) {
    searchQuery = query;
    fetchProducts();
  }

  updateUserInfo(
      {required String name,
      required String email,
      required String number,
      fileImage}) {
    notifyListeners();
    return service.updateProfileInfo(
        name: name, email: email, number: number, fileImage: fileImage);
  }

  // addProfileImage({required String username, fileimage}) {
  //   return service.addProfileImage(username: username, fileimage: fileimage);
  // }

  addProduct({
    required ProductModel product,
    required String name,
    required String uid,
  }) {
    return service.addProduct(
      product,
      name,
      uid,
    );
  }

  addToFavoraits({required ProductModel product, required String productname}) {
    return service.addToFavoraits(product, productname);
  }

  List<ProductModel> fetchFavoritItems() {
    try {
      service.firestore
          .collection('user')
          .doc(service.auth.currentUser!.uid)
          .collection('favoraits')
          .snapshots()
          .listen((favorititems) {
        favoraits = favorititems.docs
            .map((doc) => ProductModel.fromJson(doc.data()))
            .toList();
        notifyListeners();
      });
      return favoraits;
    } catch (e) {
      throw Exception();
    }
  }

  deleteFavorits({required String productname}) {
    return service.deleteFavoritItems(productname);
  }

  addProductImage({required String productname, required fileimage}) {
    return service.addProductImage(
        productname: productname, fileimage: fileimage);
  }

  List<ChatModel> getMessages(String currentUserId, String recieverId) {
    List ids = [currentUserId, recieverId];
    ids.sort();
    String chatroomid = ids.join('_');
    service.firestore
        .collection('chat_room')
        .doc(chatroomid)
        .collection('messages')
        .orderBy("time", descending: false)
        .snapshots()
        .listen((message) {
      messages =
          message.docs.map((doc) => ChatModel.toJson(doc.data())).toList();
      notifyListeners();
    });
    return messages;
  }
}
