import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'dark_theme.dart';
part 'white_theme.dart';

class AppTheme {
  static AdaptiveThemeMode? currentSavedTheme = AdaptiveThemeMode.light;

  static final ThemeData whiteTheme = ThemeData(
      primarySwatch: Colors.blue,
      // canvasColor: const Color(0xFFFF4875),
      splashColor: Colors.white,
      primaryColor: const Color(0xFFB3A1F8),
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: lightTextTheme);
  static final ThemeData darkTheme = ThemeData(
      // canvasColor: const Color(0xFFEC2D5B),
      primaryColor: const Color(0xFF574699),
      splashColor: const Color(0xFF201F24),
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: darkTextTheme);
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
