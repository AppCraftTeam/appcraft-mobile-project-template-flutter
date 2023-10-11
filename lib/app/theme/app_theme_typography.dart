import 'package:flutter/material.dart';

@immutable
class AppThemeTypography extends ThemeExtension<AppThemeTypography> {
  const AppThemeTypography({
    this.wipTitle,
    this.wipInfoTitle
  });

  final TextStyle? wipTitle;
  final TextStyle? wipInfoTitle;

  @override
  AppThemeTypography lerp(AppThemeTypography? other, double t) {
    if (other is! AppThemeTypography) return this;

    return AppThemeTypography(
      wipTitle: TextStyle.lerp(wipTitle, other.wipTitle, t),
      wipInfoTitle: TextStyle.lerp(wipInfoTitle, other.wipInfoTitle, t)
    );
  }

  @override
  ThemeExtension<AppThemeTypography> copyWith({
    TextStyle? wipTitle,
    TextStyle? wipInfoTitle
  }) {
    return AppThemeTypography(
      wipTitle: wipTitle ?? this.wipTitle,
      wipInfoTitle: wipInfoTitle ?? this.wipInfoTitle
    );
  }
}
