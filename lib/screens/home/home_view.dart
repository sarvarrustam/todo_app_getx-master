import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';
import 'package:todo_app_getx/screens/home/home_controller.dart';
import 'package:todo_app_getx/utils/app_routing/app_route_names.dart';

import '../../data/models/user_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    log('BUILLLLLLDD');
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: .0,
      //   bottomOpacity: .0,
      //   actions: [
      //     IconButton(
      //         onPressed: () async {
      //           AdaptiveTheme.of(context).setLight();
      //           // await Get.find<AuthDataProvider>().auth.signOut();
      //           // Get.toNamed(AppRouteNames.signUp.routeName);
      //         },
      //         icon: const Icon(Icons.logout))
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //!account
              GetBuilder(
                  init: controller,
                  builder: (_) {
                    return FutureBuilder(
                        future: controller.fireDataProvider.firestore!
                            .collection('users')
                            .doc(controller.auth.auth.currentUser!.uid)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CupertinoActivityIndicator());
                          }

                          if (!snapshot.hasData || snapshot.hasError) {
                            return const Center(
                              child: Text('load failed'),
                            );
                          }
                          final User user =
                              User.fromDocumentSnapshot(snapshot.data!);
                          final TaskBaseModel important =
                              TaskBaseModel.fromJson(user.taskLists!.first);
                          final TaskBaseModel tasks =
                              TaskBaseModel.fromJson(user.taskLists![1]);
                          return Column(
                            children: [
                              GetBuilder(
                                  init: controller,
                                  builder: (_) {
                                    return Card(
                                      elevation: .0,
                                      margin: EdgeInsets.zero,
                                      color: Colors.transparent,
                                      child: ListTile(
                                        onTap: controller.onEmailPressed,
                                        leading: CircleAvatar(
                                          child: Text(user.email![0]),
                                        ),
                                        title: Text(
                                          user.email ?? 'example@gmail.com',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 16.sp,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color,
                                                  fontWeight: FontWeight.w600),
                                        ),
                                        trailing: IconButton(
                                            onPressed: () {
                                              Get.toNamed(
                                                  AppRouteNames.search.route);
                                            },
                                            padding: EdgeInsets.zero,
                                            icon: Icon(
                                              Icons.search,
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color,
                                            )),
                                      ),
                                    );
                                  }),
                              GetBuilder(
                                  init: controller,
                                  builder: (_) {
                                    return _CustomCard(
                                        task: important,
                                        onTap: controller.onImportantPressed,
                                        icon: const Icon(
                                          Icons.star,
                                          color: Colors.red,
                                        ));
                                  }),
                              _CustomCard(
                                  task: tasks,
                                  onTap: controller.onTasksPressed,
                                  icon: Icon(
                                    Icons.house_siding,
                                    color: Theme.of(context).primaryColor,
                                  )),
                              Divider(
                                indent: 20.w,
                                endIndent: 20.w,
                                thickness: 1.h,
                              )
                            ],
                          );
                        });
                  }),

              //? Tasks
              GetBuilder(
                  init: controller,
                  builder: (_) {
                    return FutureBuilder(
                        future: controller.fireDataProvider.firestore!
                            .collection('users')
                            .doc(controller.auth.auth.currentUser!.uid)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CupertinoActivityIndicator());
                          }

                          if (!snapshot.hasData || snapshot.hasError) {
                            return const Center(
                              child: Text('load failed'),
                            );
                          }
                          final User user =
                              User.fromDocumentSnapshot(snapshot.data!);
                          final filteredList = user.taskLists!
                              .where((element) =>
                                  element['id'] != 'task000' &&
                                  element['id'] != 'task111')
                              .toList();
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: filteredList.length,
                              itemBuilder: (context, index) {
                                final TaskBaseModel task =
                                    TaskBaseModel.fromJson(filteredList[index]);
                                return _CustomCard(
                                    task: task,
                                    onTap: () => controller.onListTilePressed(
                                        taskBase: task),
                                    icon: Icon(
                                      Icons.menu,
                                      color: Theme.of(context).primaryColor,
                                    ));
                              });
                        });
                  })
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).splashColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: GetBuilder(
          init: controller,
          builder: (_) {
            return FloatingActionButton.extended(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  // await FirebaseAuth.instance.signOut();

                  controller.showCustomDiolog(context);
                },
                elevation: .0,
                backgroundColor: Theme.of(context).splashColor,
                foregroundColor: Theme.of(context).primaryColor,
                label: const Text('New List'));
          }),
    );
  }
}

// ignore: unused_element
class _CustomCard extends StatelessWidget {
  const _CustomCard(
      {required this.task, required this.onTap, required this.icon});
  final TaskBaseModel? task;
  final VoidCallback? onTap;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .0,
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      child: ListTile(
        onTap: onTap,
        leading: icon,
        title: Text(
          task!.name ?? 'task',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: 'Roboto',
              fontSize: 16.sp,
              color: Theme.of(context).iconTheme.color,
              fontWeight: FontWeight.w600),
        ),
        trailing: IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.chevron_right,
              color: Theme.of(context).iconTheme.color,
            )),
      ),
    );
  }
}
