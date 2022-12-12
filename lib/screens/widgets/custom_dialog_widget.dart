import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDialogWidget extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final String dialogName;
  final VoidCallback onConfirmed;
  final bool hasIcon;
  final String buttonName;
  const CustomDialogWidget(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.dialogName,
      required this.onConfirmed,
      required this.hasIcon,
      required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).splashColor,
      buttonPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: .0),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.w)),
      title: Text(
        dialogName,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).iconTheme.color),
      ),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16.sp),
            filled: false,
            fillColor: const Color(0xFFFAF9FB),
            border: UnderlineInputBorder(
                borderSide:
                    BorderSide(width: 2.h, color: const Color(0xFFA9A8AA)))),
      ),
      actions: [
        ButtonBar(
          children: [
            TextButton(
                onPressed: Get.back,
                child: Text(
                  'cancel',
                  style: Theme.of(context).textTheme.bodySmall,
                )),
            ElevatedButton.icon(
                icon: hasIcon ? const Icon(Icons.add) : const SizedBox.shrink(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.w))),
                onPressed: onConfirmed,
                label: Text(
                  buttonName,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                )),
          ],
        )
      ],
    );
  }
}
