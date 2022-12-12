import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_getx/data/models/task.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';
import 'package:todo_app_getx/screens/important/important_controller.dart';
import 'package:todo_app_getx/screens/widgets/custom_slider_widget.dart';

class ImportantView extends GetView<ImportantController> {
  const ImportantView({super.key, this.taskBase});
  final TaskBaseModel? taskBase;
  @override
  Widget build(BuildContext context) {
    log('BUILDDD');
    return GetBuilder(
        init: controller,
        builder: (_) {
          return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: controller.query,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (!snapshot.hasData || snapshot.hasError) {
                  return const Center(
                    child: Text('data failed'),
                  );
                }
                List<QueryDocumentSnapshot<Map<String, dynamic>>> dataList =
                    taskBase != null
                        ? List.from(snapshot.data!.docs.where((element) =>
                            element.data()['taskListId'] == taskBase!.id))
                        : List.from(snapshot.data!.docs);
                var newList = dataList.map((e) => Task.fromJson(e.data()));
                log(newList.toString());
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      final task = newList.elementAt(index);
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 2.h),
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
              });
        });
  }
}
