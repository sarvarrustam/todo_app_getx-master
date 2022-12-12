import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';
import 'package:todo_app_getx/data/localization/app_localization.dart';
import 'package:todo_app_getx/screens/auth/sign_up/sign_up_view.dart';
import 'package:todo_app_getx/screens/home/home_binding.dart';
import 'package:todo_app_getx/screens/home/home_view.dart';
import 'package:todo_app_getx/utils/app_routing/constants.dart';
import 'package:todo_app_getx/utils/theme/themes.dart';
import 'package:get/get.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AppTheme.currentSavedTheme ?? AdaptiveThemeMode.dark,
      light: AppTheme.whiteTheme,
      dark: AppTheme.darkTheme,
      builder: (light, dark) => GetMaterialApp(
        title: 'Flutter Demo',
        darkTheme: dark,
        builder: DevicePreview.appBuilder,
        getPages: AppRouting.appPages,
        useInheritedMediaQuery: false,
        theme: light,
        defaultTransition: Transition.native,
        initialBinding: HomeBinding(),
        home: StreamBuilder<auth.User?>(
          stream: Get.find<AuthDataProvider>().auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const HomeView();
              } else {
                return const SignUpView();
              }
            }
            return const SignUpView();
          },
        ),
        locale: Get.deviceLocale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        translations: AppLocalizations(),
        supportedLocales: const [Locale('uz', 'UZ'), Locale('en', 'GB')],
        fallbackLocale: const Locale('en', 'GB'),
      ),
    );
  }
}
