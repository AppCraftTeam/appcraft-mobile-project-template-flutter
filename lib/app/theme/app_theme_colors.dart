import 'package:flutter/material.dart';

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {

  const AppThemeColors({
    this.wipTitle
  });

  final Color? wipTitle;

  @override
  ThemeExtension<AppThemeColors> copyWith({
    Color? wipTitle
  }) {
    return AppThemeColors(
      wipTitle: wipTitle ?? this.wipTitle
    );
  }

  @override
  AppThemeColors lerp(AppThemeColors? other, double t) {
    if (other is! AppThemeColors) return this;

    return AppThemeColors(
      wipTitle: Color.lerp(wipTitle, other.wipTitle, t)
    );
  }

}