import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_place/service/auth_service.dart';

class AuthProviders extends ChangeNotifier {
  Future<UserCredential>? user;
  AuthService service = AuthService();
  signInWithEmail(String email, String password, BuildContext context) {
    return service.signInWithEmailAndPassword(email, password, context);
  }

  signUpWithEmail(String email, String password, String name) async {
    try {
      await service.signUpWithEmailAndPassword(name, email, password);
    } catch (e) {
      Exception('Signup email error$e');
    }
  }

  signUpWithGoogle() {
    return service.signInWithGoogle();
  }

  signUpWithGithub(context) {
    return service.signInWithGithub(context);
  }

  signOut() {
    return service.signout();
  }
}
