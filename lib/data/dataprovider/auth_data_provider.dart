import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthDataProvider extends GetxService {
  late final FirebaseAuth _auth;
  AuthDataProvider() {
    _auth = FirebaseAuth.instance;
    log('FIREBASE AUTH INITED');
  }

  Future<UserCredential?> signUp(
      {required String email, required String password}) async {
    try {
      final userCredentional = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      debugPrint('User signed up');
      return userCredentional;
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
    return null;
  }

  Future<bool> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      debugPrint('User signed IN');
      return true;
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
    return false;
  }

  FirebaseAuth get auth => _auth;
}
