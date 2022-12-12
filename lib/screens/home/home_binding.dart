import 'package:get/instance_manager.dart';
import 'package:todo_app_getx/screens/auth/profile/profile_controller.dart';
import 'package:todo_app_getx/screens/auth/sign_in/sign_in_controller.dart';
import 'package:todo_app_getx/screens/auth/sign_up/sign_up_controller.dart';
import 'package:todo_app_getx/screens/complated/complated_controller.dart';
import 'package:todo_app_getx/screens/home/home_controller.dart';
import 'package:todo_app_getx/screens/important/important_controller.dart';
import 'package:todo_app_getx/screens/search/search_controller.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_controller.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_view/task_list_view_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SearchController>(() => SearchController());
    Get.lazyPut<ImportantController>(() => ImportantController());
    Get.lazyPut<ComplatedController>(() => ComplatedController());
    Get.lazyPut<TaskListController>(() => TaskListController());
    Get.lazyPut<TaskListViewController>(() => TaskListViewController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
