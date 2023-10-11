import 'package:flutter/material.dart';

import '../../resources/colors.gen.dart';
import '../../resources/fonts.gen.dart';
import 'app_theme_colors.dart';
import 'app_theme_typography.dart';

@immutable
class AppThemeData {
  const AppThemeData({required this.colors, required this.typography});

  final AppThemeColors colors;
  final AppThemeTypography typography;

  static ThemeData lightThemeData() {
    return ThemeData(
      extensions: const [
        AppThemeColors(
          wipTitle: AppColor.hex000000
        ),
        AppThemeTypography(
          wipTitle: TextStyle(fontFamily: AppFont.roboto, fontWeight: FontWeight.w600, fontSize: 20),
          wipInfoTitle: TextStyle(fontFamily: AppFont.roboto, fontWeight: FontWeight.w400, fontSize: 14)
        )
      ]
    );
  }
}

extension AppTheme on BuildContext {

  AppThemeData get theme {
    final theme = Theme.of(this);

    return AppThemeData(
      colors: theme.extension<AppThemeColors>() ?? const AppThemeColors(),
      typography: theme.extension<AppThemeTypography>() ?? const AppThemeTypography()
    );
  }

  AppThemeColors get colors => theme.colors;
  AppThemeTypography get typography => theme.typography;
}
