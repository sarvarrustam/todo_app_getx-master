import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  ValueChanged<String?>? validator;
  CustomField(
      {super.key,
      required this.controller,
      required this.placeholder,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      controller: controller,
      onSubmitted: validator,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
