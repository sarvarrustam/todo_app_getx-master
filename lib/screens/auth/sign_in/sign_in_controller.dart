import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/data/repositories/auth_data_repository.dart';
import 'package:todo_app_getx/utils/app_routing/app_route_names.dart';

abstract class SignInControllerRepository {
  void checkEmail(String? value);
  void validPassword(String? value);
  void changeVisibility();
  void signIn();
  void onSignUpButtonPressed();
}

class SignInController extends GetxController
    implements SignInControllerRepository {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthDataRepository _authDataRepository = Get.find<AuthDataRepository>();
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
  void signIn() async {
    try {
      if (password.text.isEmpty || emailController.text.isEmpty) return;
      final signedIn = await _authDataRepository.signInRepo(
          email: emailController.text.trim(), password: password.text.trim());
      if (signedIn) {
        Get.snackbar('auth', 'Success');
        emailController.clear();
        password.clear();
        Get.toNamed(AppRouteNames.home.route);
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  @override
  void onSignUpButtonPressed() {
    Get.back();
  }
}
