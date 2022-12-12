import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';
import 'package:todo_app_getx/data/dataprovider/fire_data_provider.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';
import 'package:todo_app_getx/screens/widgets/custom_dialog_widget.dart';
import 'package:todo_app_getx/utils/app_routing/app_route_names.dart';
import 'package:uuid/uuid.dart';

abstract class HomeRepository {
  Future<void> createTaskList();
  void onImportantPressed();
  void showCustomDiolog(BuildContext context);
  void onTasksPressed();
  void onListTilePressed({required TaskBaseModel taskBase});

  void onEmailPressed();
}

class HomeController extends GetxController implements HomeRepository {
  final FireDataProvider fireDataProvider = Get.find<FireDataProvider>();
  final AuthDataProvider auth = Get.find<AuthDataProvider>();
  final TextEditingController taskListController = TextEditingController();

  final box = GetStorage();
  void changeTheme() {
    update();
  }

  @override
  Future<void> createTaskList() async {
    try {
      assert(taskListController.text.isNotEmpty);
      final taskListId = const Uuid().v1();
      final listSaved = await fireDataProvider.createTaskCollection(
          uid: auth.auth.currentUser!.uid,
          taskBase: TaskBaseModel(
              userId: auth.auth.currentUser!.uid,
              id: taskListId,
              name: taskListController.text,
              publishDate: DateTime.now()));

      if (listSaved) {
        Get.snackbar('New list', 'Task list created');
        taskListController.clear();
        update();
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
  }

  @override
  void showCustomDiolog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CustomDialogWidget(
              controller: taskListController,
              placeholder: 'Enter list title',
              dialogName: 'New List',
              onConfirmed: () {
                createTaskList();
                Get.back();
              },
              hasIcon: true,
              buttonName: 'Add');
        });
  }

  @override
  void onImportantPressed() {
    Get.toNamed(AppRouteNames.important.route);
    update();
  }

  @override
  void onTasksPressed() {
    Get.toNamed(AppRouteNames.complated.route);
    update();
  }

  @override
  void onListTilePressed({required TaskBaseModel taskBase}) async {
    Get.toNamed(AppRouteNames.taskListPage.route,
        arguments: {'task_base': taskBase.toJson()});
    update();
  }

  @override
  void onEmailPressed() {
    Get.toNamed(AppRouteNames.profile.route);
  }
}
