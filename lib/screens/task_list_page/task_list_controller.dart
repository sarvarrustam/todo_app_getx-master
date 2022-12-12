import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';
import 'package:todo_app_getx/data/dataprovider/fire_data_provider.dart';
import 'package:todo_app_getx/data/models/task.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';
import 'package:todo_app_getx/utils/app_routing/constants.dart';
import 'package:uuid/uuid.dart';

class TaskListController extends GetxController {
  late final TaskBaseModel _taskBase;
  late bool isButton = true;
  final focusNode = FocusNode();
  final TextEditingController taskController = TextEditingController();
  final _firstoreProvider = Get.find<FireDataProvider>();
  final _fireAuth = Get.find<AuthDataProvider>();
  bool? _isComplated = false;
  final arguments = Get.arguments;
  final box = GetStorage();

  @override
  void onInit() {
    isButton = true;
    _taskBase = TaskBaseModel.fromJson(arguments['task_base']);
    update();
    super.onInit();
  }

  onButtonHide(bool value) {
    isButton = value;
    update();
  }

  onAddTaskPressed() {
    onButtonHide(false);
    Future.delayed(Duration.zero, () {});
  }

  changeComplated(bool isComplated) {
    _isComplated = isComplated;
    update();
  }

  void createTask() async {
    try {
      if (taskController.text.isEmpty) return;
      final taskId = const Uuid().v1();

      final Task task = Task(
          id: taskId,
          userId: _fireAuth.auth.currentUser!.uid,
          task: taskController.text,
          isCompleted: _isComplated,
          isFavourite: false,
          publishedDate: DateTime.now(),
          taskListId: taskBase.id,
          taskListName: taskBase.name);
      final isSavedToDb = await _firstoreProvider.createTask(
          task: task,
          collectionName: CollectionNames.generateSimpleTaskCollectionName(
              name: task.taskListName!, id: task.taskListId!));
      if (_isComplated!) {
        final isComplatedSaved = await _firstoreProvider.createTask(
            task: task,
            collectionName: CollectionNames.complatedCollectionName);
        if (isComplatedSaved) {
          log('task Complated-------');
        }
      }
      if (isSavedToDb) {
        Get.snackbar('${task.taskListName}', 'task successfully created');
        clearTask();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() async {
    await box.remove('task_base');
    super.onClose();
  }

  void clearTask() {
    _isComplated = false;
    taskController.clear();
    update();
  }

  bool get isComplated => _isComplated!;
  TaskBaseModel get taskBase => _taskBase;
}
