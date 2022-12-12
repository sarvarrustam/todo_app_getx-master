import 'package:get/get.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_view/task_list_view_controller.dart';

class TaskListViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskListViewController>(() => TaskListViewController());
  }
}
