import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app_getx/di/service_locator.dart';
import 'package:todo_app_getx/firebase_options.dart';
import 'package:todo_app_getx/utils/theme/themes.dart';

class AppSetup {
  static Future<void> get setup async {
    WidgetsFlutterBinding.ensureInitialized();
    AppTheme.currentSavedTheme = await AdaptiveTheme.getThemeMode();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await GetStorage.init();
    await GetSrcLocator.initServices();
  }
}
