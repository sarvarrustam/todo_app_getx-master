import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_app_getx/screens/complated/complated_controller.dart';
import 'package:todo_app_getx/screens/complated/complated_view.dart';

class ComplatedPage extends GetView<ComplatedController> {
  const ComplatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('BUILDDD');
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: const Text('Complated'),
          elevation: .0,
          centerTitle: false,
          backgroundColor: Colors.transparent,
        ),
        body: const ComplatedView());
  }
}
