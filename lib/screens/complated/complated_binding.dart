import 'package:get/get.dart';
import 'package:todo_app_getx/screens/complated/complated_controller.dart';
import 'package:todo_app_getx/screens/important/important_controller.dart';

class ComplatedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportantController>(() => ImportantController());
    Get.lazyPut<ComplatedController>(() => ComplatedController());
  }
}
