import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomAddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .0,
      margin: EdgeInsets.zero,
      color: Colors.black.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.w)),
      child: ListTile(
        dense: true,
        onTap: onTap,
        minLeadingWidth: 10.w,
        leading: const Icon(Icons.add),
        title: const Text('Add task'),
      ),
    );
  }
}
