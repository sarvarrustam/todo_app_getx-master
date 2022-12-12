import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo_app_getx/screens/complated/complated_controller.dart';
import 'package:todo_app_getx/screens/important/important_view.dart';

class ImportantPage extends GetView<ComplatedController> {
  const ImportantPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('BUILDDD');
    return Scaffold(
        backgroundColor: const Color(0xFFFF4875),
        appBar: AppBar(
          title: const Text('Important'),
          elevation: .0,
          centerTitle: false,
          backgroundColor: Colors.transparent,
        ),
        body: const ImportantView());
  }
}
