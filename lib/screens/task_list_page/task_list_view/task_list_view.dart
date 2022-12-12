import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_getx/data/models/task.dart';
import 'package:todo_app_getx/screens/task_list_page/task_list_view/task_list_view_controller.dart';
import 'package:todo_app_getx/screens/widgets/custom_slider_widget.dart';

class TaskListView extends GetView<TaskListViewController> {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetBuilder(
        init: controller,
        builder: (_) {
          return FirestoreListView(
              shrinkWrap: true,
              query: controller.fireStoreSrc.firestore!
                  .collection('users')
                  .doc(controller.taskBase.userId!)
                  .collection(
                      '${controller.taskBase.name}_${controller.taskBase.id}')
                  .orderBy('publishedDate', descending: true),
              loadingBuilder: (context) => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
              errorBuilder: (context, error, stackTrace) => const Center(
                    child: Text('data failed'),
                  ),
              itemBuilder: (context, snapshot) {
                if (!snapshot.exists) {
                  return const Center(
                    child: Text('data failed'),
                  );
                }
                final Task task = Task.fromJson(snapshot.data());
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
                  child: CustomSliderWidget(
                    sliderKey: task.id.toString(),
                    onDeletePressed: (context) =>
                        controller.deleteTask(task: task),
                    isComplated: task.isCompleted!,
                    isFavourite: task.isFavourite!,
                    title: task.task!,
                    time: DateFormat.yMMMMd().format(task.publishedDate!),
                    onValueChanged: (value) => controller.changeComplated(
                        task: task, isComplated: value!),
                    onTapFavoirite: () =>
                        controller.changeFavourite(task: task),
                  ),
                );
              });
        },
      ),
    );
  }
}
