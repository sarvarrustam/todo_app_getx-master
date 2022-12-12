import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTaskField extends StatelessWidget {
  final ValueChanged<String> onSubmitted;
  final ValueChanged<bool?> onChangeCheck;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool isComplated;
  const CustomTaskField(
      {super.key,
      required this.onSubmitted,
      required this.onChangeCheck,
      required this.focusNode,
      required this.controller,
      required this.isComplated});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckboxListTile(
              value: isComplated,
              dense: true,
              tileColor: Colors.transparent,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: onChangeCheck,
              title: TextField(
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: .0),
                    border: InputBorder.none,
                    hintText: 'Task name'),
                onSubmitted: onSubmitted,
                focusNode: focusNode,
                controller: controller,
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -10),
              child: Divider(
                indent: 20.w,
                endIndent: 20.w,
                thickness: 2.h,
              ),
            )
          ],
        ));
  }
}
