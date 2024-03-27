import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:market_place/model/product_model.dart';
import 'package:market_place/model/user_model.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Reference storage = FirebaseStorage.instance.ref();
  String? downloadUrl;

  addProduct(ProductModel product, String name, String uid) async {
    try {
      await firestore.collection("products").doc(name).set(product.toJson());
      await firestore
          .collection("user")
          .doc(auth.currentUser!.uid)
          .collection('product')
          .doc(name)
          .set(product.toJson());
    } catch (e) {
      throw Exception();
    }
  }

  addProductImage({required String productname, required fileimage}) async {
    Reference folder = storage.child('productimage');
    Reference image = folder.child("${productname}.jpg");
    try {
      await image.putFile(fileimage);
      downloadUrl = await image.getDownloadURL();
    } catch (e) {
      throw Exception(e);
    }
  }

  updateProfileInfo(
      {required String name,
      required String email,
      required String number,
      required String image}) async {
    try {
      UserModel user = UserModel(
          name: name,
          email: email,
          phonenumber: number,
          image: image,
          uid: auth.currentUser!.uid);
      await firestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .update(user.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  addProfileImage({required String username, required fileimage}) async {
    Reference folder = storage.child('profileimage');
    Reference image = folder.child("${username}.jpg");
    try {
      await image.putFile(fileimage);
      downloadUrl = await image.getDownloadURL();
    } catch (e) {
      throw Exception();
    }
  }

  addToFavoraits(ProductModel product, String productname) async {
    try {
      await firestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .collection('favoraits')
          .doc(productname)
          .set(product.toJson());
    } catch (e) {
      throw Exception();
    }
  }

  deleteFavoritItems(String productname) async {
    try {
      await firestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .collection('favoraits')
          .doc(productname)
          .delete();
    } catch (e) {
      throw Exception();
    }
  }
}
