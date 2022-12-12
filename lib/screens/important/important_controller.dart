import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';
import 'package:todo_app_getx/data/dataprovider/fire_data_provider.dart';
import 'package:todo_app_getx/data/models/task.dart';
import 'package:todo_app_getx/utils/app_routing/constants.dart';

class ImportantController extends GetxController {
  final fireStore = Get.find<FireDataProvider>();

  final auth = Get.find<AuthDataProvider>();
  late final Stream<QuerySnapshot<Map<String, dynamic>>> query;

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() {
    try {
      query = fireStore.firestore!
          .collection('users')
          .doc(auth.auth.currentUser!.uid)
          .collection(
              '${TaskListEnum.important.name}_${TaskListEnum.important.id}')
          .orderBy('publishedDate', descending: true)
          .snapshots();
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  void changeFavourite({required Task task}) async {
    try {
      final isUpdated = await fireStore.updateTask(
          task: task.copyWith(isFavourite: !task.isFavourite!),
          collectionName: CollectionNames.generateSimpleTaskCollectionName(
              name: task.taskListName!, id: task.taskListId!));
      if (isUpdated) {
        if (!task.isFavourite!) {
          final isFavouriteSaved = await fireStore.createTask(
              task: task.copyWith(isFavourite: !task.isFavourite!),
              collectionName: CollectionNames.importantCollectionName);
        } else {
          final isFavouriteDeleted = await fireStore.deleteTask(
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
      final isUpdated = await fireStore.updateTask(
          task: task.copyWith(isCompleted: isComplated),
          collectionName: CollectionNames.generateSimpleTaskCollectionName(
              name: task.taskListName!, id: task.taskListId!));
      final isUpdatedFavouriteComplated = await fireStore.updateTask(
          task: task.copyWith(isCompleted: isComplated),
          collectionName: CollectionNames.importantCollectionName);
      if (isComplated) {
        log('task Complated-------');
        final isComplatedSaved = await fireStore.createTask(
            task: task.copyWith(isCompleted: isComplated),
            collectionName: CollectionNames.complatedCollectionName);
        update();
      } else {
        final isComplatedDeleted = await fireStore.deleteTask(
            task: task.copyWith(isCompleted: isComplated),
            collectionName: CollectionNames.complatedCollectionName);
        update();
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
      final isDeleted = await fireStore.deleteTask(
          task: task,
          collectionName: CollectionNames.generateSimpleTaskCollectionName(
              name: task.taskListName!, id: task.taskListId!));
      if (isDeleted) {
        final deletedFromCompleted = await fireStore.deleteTask(
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
