import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_place/service/auth/auth_service.dart';

class AuthProviders extends ChangeNotifier {
  Future<UserCredential>? user;
  AuthService service = AuthService();
  signInWithEmail(String email, String password, BuildContext context) {
    return service.signInWithEmailAndPassword(email, password, context);
  }

  signUpWithEmail(String email, String password, String name) {
    return service.signUpWithEmailAndPassword(name, email, password);
  }

  signUpWithGoogle() {
    return service.signInWithGoogle();
  }

  signUpWithGithub(context) {
    return service.signInWithGithub(context);
  }
}
