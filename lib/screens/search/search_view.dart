import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/data/models/task_list_model.dart';
import 'package:todo_app_getx/data/models/user_model.dart';
import 'package:todo_app_getx/screens/search/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: .0,
        bottomOpacity: .0,
        centerTitle: true,
        title: Text(
          'Search List',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_left,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder(
            init: controller,
            builder: (_) {
              return FutureBuilder(
                future: controller.fireDataProvider.firestore!
                    .collection('users')
                    .doc(controller.auth.auth.currentUser!.uid)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CupertinoActivityIndicator());
                  }

                  if (!snapshot.hasData || snapshot.hasError) {
                    return const Center(
                      child: Text('load failed'),
                    );
                  }
                  final User user = User.fromDocumentSnapshot(snapshot.data!);
                  final List<TaskBaseModel> tasks = user.taskLists!
                      .map(
                        (e) => TaskBaseModel.fromJson(e),
                      )
                      .toList();
                  return Autocomplete<TaskBaseModel>(
                    fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: CupertinoSearchTextField(
                          controller: textEditingController,
                          onSubmitted: (value) => onFieldSubmitted(),
                          focusNode: focusNode,
                        ),
                      );
                    },
                    optionsViewBuilder: (context, onSelected, options) =>
                        ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            itemCount: options.length,
                            itemBuilder: (context, index) => Card(
                                color: Colors.transparent,
                                elevation: .0,
                                child: ListTile(
                                  tileColor: Colors.transparent,
                                  title: Text(
                                      options.elementAt(index).name ?? 'task'),
                                  onTap: () =>
                                      onSelected(options.elementAt(index)),
                                ))),
                    displayStringForOption: (TaskBaseModel option) =>
                        option.name!,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return const Iterable.empty();
                      }
                      return tasks.where((element) =>
                          element.name!.contains(textEditingValue.text));
                    },
                    onSelected: (option) {
                      log(option.name.toString());
                    },
                  );
                },
              );
            }),
      ),
    );
  }
}
