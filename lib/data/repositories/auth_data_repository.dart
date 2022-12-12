import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';

import '../models/user_model.dart';

class AuthDataRepository extends GetxService {
  late final AuthDataProvider authDataProvider;
  AuthDataRepository() {
    try {
      authDataProvider = Get.find<AuthDataProvider>();
      log('AUTH REPO INITED');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<User?> signUpRepo(
      {required String email,
      required String username,
      required String password}) async {
    try {
      final userCredentional =
          await authDataProvider.signUp(email: email, password: password);
      return User(
          uid: userCredentional!.user!.uid,
          email: email,
          photoAvatarUrl: '',
          password: password,
          userCreatedDate: DateTime.now(),
          username: username);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
    return null;
  }

  Future<bool> signInRepo(
      {required String email, required String password}) async {
    try {
      final signedIn =
          await authDataProvider.signIn(email: email, password: password);
      debugPrint('User signed IN');
      return signedIn;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
    return false;
  }
}
