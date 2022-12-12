import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo_app_getx/data/dataprovider/fire_data_provider.dart';
import 'package:todo_app_getx/data/models/task.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';
import 'package:todo_app_getx/utils/app_routing/constants.dart';

class TaskListViewController extends GetxController {
  final arguments = Get.arguments;
  final FireDataProvider fireStoreSrc = Get.find<FireDataProvider>();
  late final TaskBaseModel taskBase;

  @override
  void onInit() {
    taskBase = TaskBaseModel.fromJson(arguments['task_base']);
    log(taskBase.toString());
    super.onInit();
  }

  void changeFavourite({required Task task}) async {
    try {
      final isUpdated = await fireStoreSrc.updateTask(
          task: task.copyWith(isFavourite: !task.isFavourite!),
          collectionName: CollectionNames.generateSimpleTaskCollectionName(
              name: task.taskListName!, id: task.taskListId!));
      if (isUpdated) {
        if (!task.isFavourite!) {
          final isFavouriteSaved = await fireStoreSrc.createTask(
              task: task.copyWith(isFavourite: !task.isFavourite!),
              collectionName: CollectionNames.importantCollectionName);
        } else {
          final isFavouriteDeleted = await fireStoreSrc.deleteTask(
              task: task.copyWith(isFavourite: !task.isFavourite!),
              collectionName: CollectionNames.importantCollectionName);
        }

        Get.snackbar('${task.task}', 'task successfully updated');
      }
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  void changeComplated({required Task task, required bool isComplated}) async {
    try {
      final isUpdated = await fireStoreSrc.updateTask(
          task: task.copyWith(isCompleted: isComplated),
          collectionName: CollectionNames.generateSimpleTaskCollectionName(
              name: task.taskListName!, id: task.taskListId!));

      if (isComplated) {
        log('task Complated-------');
        final isComplatedSaved = await fireStoreSrc.createTask(
            task: task.copyWith(isCompleted: isComplated),
            collectionName: CollectionNames.complatedCollectionName);
      } else {
        final isComplatedDeleted = await fireStoreSrc.deleteTask(
            task: task.copyWith(isCompleted: isComplated),
            collectionName: CollectionNames.complatedCollectionName);
      }
      if (isUpdated) {
        Get.snackbar('${task.task}', 'task successfully updated');
      }
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  void deleteTask({required Task task}) async {
    try {
      final isDeleted = await fireStoreSrc.deleteTask(
          task: task,
          collectionName: CollectionNames.generateSimpleTaskCollectionName(
              name: task.taskListName!, id: task.taskListId!));
      if (isDeleted) {
        final deletedFromCompleted = await fireStoreSrc.deleteTask(
            task: task,
            collectionName: CollectionNames.complatedCollectionName);
        if (deletedFromCompleted) {
          Get.snackbar('${task.task}', 'task successfully deleted');
        }
      }
    } catch (e) {
      log(e.toString());
    }
    update();
  }
}
