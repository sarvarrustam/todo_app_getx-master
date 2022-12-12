import 'dart:math';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/data/models/user_model.dart';
import 'package:todo_app_getx/screens/auth/profile/profile_controller.dart';
import 'package:todo_app_getx/utils/theme/themes.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).iconTheme.color),
        ),
        backgroundColor: Theme.of(context).splashColor,
        elevation: .0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Transform.rotate(
              angle: pi / 4,
              child: Icon(
                CupertinoIcons.add,
                color: Theme.of(context).iconTheme.color,
              )),
        ),
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: controller.fireDataProvider.firestore!
            .collection('users')
            .doc(controller.authDataProvider.auth.currentUser!.uid)
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
          return SizedBox(
            width: context.mediaQuerySize.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30.w,
                  child: Text(user.username![0]),
                ),
                Text(
                  user.username!,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  user.email!,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                GetBuilder(
                    init: controller,
                    builder: (_) {
                      return TextButton(
                          onPressed: controller.signOut,
                          child: const Text(
                            'Sign Out',
                            style: TextStyle(color: Color(0xFFF85977)),
                          ));
                    }),
                Divider(
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                    width: context.mediaQuerySize.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mode',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context).iconTheme.color),
                        ),
                        GetBuilder(
                            init: controller,
                            builder: (_) {
                              return Row(
                                children: [
                                  CustomChip(
                                      isSelected: AppTheme.currentSavedTheme ==
                                          AdaptiveThemeMode.light,
                                      label: 'Light',
                                      icon: Icons.sunny,
                                      onTap: () {
                                        context.light;
                                        controller.changeTheme(
                                            AdaptiveThemeMode.light);
                                      }),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  CustomChip(
                                      isSelected: AppTheme.currentSavedTheme ==
                                          AdaptiveThemeMode.dark,
                                      label: 'Dark',
                                      icon: Icons.nightlight_round_outlined,
                                      onTap: () {
                                        context.dark;
                                        controller.changeTheme(
                                            AdaptiveThemeMode.dark);
                                      }),
                                ],
                              );
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip(
      {super.key,
      required this.isSelected,
      required this.label,
      required this.icon,
      required this.onTap});
  final bool isSelected;
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
          avatar: Icon(
            icon,
            size: 20.w,
            color: Theme.of(context).primaryColor,
          ),
          backgroundColor:
              isSelected ? Colors.blue[100] : Theme.of(context).splashColor,
          side: BorderSide(width: 1.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          padding: EdgeInsets.all(10.w),
          label: Text(
            label,
            style: Theme.of(context).textTheme.displaySmall,
          )),
    );
  }
}

extension on BuildContext {
  get light {
    AdaptiveTheme.of(this).setLight();
  }

  get dark {
    AdaptiveTheme.of(this).setDark();
  }

  ThemeData get theme {
    return AdaptiveTheme.of(this).theme;
  }

  get changeTheme {
    if (AdaptiveTheme.of(this).mode == AdaptiveThemeMode.dark) {
      light;
    } else {
      dark;
    }
  }
}
