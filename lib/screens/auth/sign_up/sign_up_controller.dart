import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';
import 'package:todo_app_getx/data/models/user_model.dart';
import 'package:todo_app_getx/data/repositories/auth_data_repository.dart';
import 'package:todo_app_getx/data/repositories/fire_data_repository.dart';
import 'package:todo_app_getx/utils/app_routing/app_route_names.dart';

abstract class SignUpControllerRepository {
  void checkEmail(String? value);
  void validPassword(String? value);
  void changeVisibility();
  void confirmPasswordValidator(String? value);
  void signUp();
  void onSignInButtonPressed();
}

class SignUpController extends GetxController
    implements SignUpControllerRepository {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final AuthDataRepository authRepo = Get.find<AuthDataRepository>();
  final FireDataRepository firestoreDb = Get.find<FireDataRepository>();
  bool? isObscure = true;
  @override
  void checkEmail(String? value) {
    bool? isEmail = GetUtils.isEmail(value!);

    if (isEmail) {
      ///to do
      ///
    }
    Get.snackbar('email', "email xato kiritilgan");
    update();
  }

  @override
  void validPassword(String? value) {
    if (value!.length < 8) {
      Get.snackbar('password', 'Kiritilgan password 8 ta belgidan kam');
      update();
    }
  }

  @override
  void changeVisibility() {
    isObscure = !isObscure!;
    update();
  }

  @override
  void confirmPasswordValidator(String? value) {
    if (value != password.text) {
      Get.snackbar('confirm password', 'Kiritigan parollar mos emas');
      update();
    }
  }

  @override
  void signUp() async {
    try {
      if (!GetUtils.isEmail(emailController.text)) return;
      if (username.text.isEmpty ||
          password.text.isEmpty ||
          confirmPassword.text.isEmpty) return;
      if (password.text != confirmPassword.text) return;

      final user = await authRepo.signUpRepo(
          email: emailController.text,
          username: username.text,
          password: password.text);
      final newUser = user!.copyWith(taskLists: [
        TaskBaseModel(
                id: 'task000',
                name: 'important',
                publishDate: DateTime.now(),
                userId: user.uid)
            .toJson(),
        TaskBaseModel(
                id: 'task111',
                name: 'tasks',
                publishDate: DateTime.now(),
                userId: user.uid)
            .toJson(),
      ]);
      if (newUser.uid != null) {
        final savedToDb = await firestoreDb.createDataCollectionRepo<User>(
            data: newUser, collectionName: 'users', id: newUser.uid);
        if (savedToDb) {
          Get.snackbar('success', 'Siz muvofaqqiyatli royxatdan otdingiz');
          emailController.clear();
          password.clear();
          confirmPassword.clear();
          username.clear();
          Get.toNamed(AppRouteNames.home.route);
        }
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  @override
  void onSignInButtonPressed() {
    Get.toNamed(AppRouteNames.signIn.route);
  }
}
