import 'package:get/get.dart';
import 'package:todo_app_getx/screens/auth/sign_in/sign_in_controller.dart';
import 'package:todo_app_getx/screens/auth/sign_up/sign_up_controller.dart';
import 'package:todo_app_getx/screens/home/home_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
