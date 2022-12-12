import 'package:get/instance_manager.dart';
import 'package:todo_app_getx/screens/auth/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
