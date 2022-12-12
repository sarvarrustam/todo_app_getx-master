import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool isObscure;
  final ValueChanged<String> validator;
  final VoidCallback onPressed;
  final IconData icon;
  final bool isSuffix;
  const CustomPasswordField(
      {super.key,
      required this.controller,
      required this.placeholder,
      required this.isObscure,
      required this.validator,
      required this.onPressed,
      required this.isSuffix,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placeholder,
      controller: controller,
      obscureText: isObscure,
      onSubmitted: validator,
      maxLength: 10,
      suffix: isSuffix
          ? IconButton(
              icon: Icon(icon),
              color: Theme.of(context).textTheme.bodyMedium!.color,
              padding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4),
              onPressed: onPressed,
            )
          : const SizedBox.shrink(),
      suffixMode: OverlayVisibilityMode.always,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
