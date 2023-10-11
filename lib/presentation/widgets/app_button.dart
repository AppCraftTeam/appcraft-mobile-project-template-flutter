import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppButton extends ElevatedButton {
  // TODO Style the button
  // TODO Implement loading indicator
  AppButton({
    required String label,
    required VoidCallback? onPressed,
    ButtonType type = ButtonType.green,
    bool isLoading = false,
  }) : super(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: type.background,
            disabledForegroundColor: type.background.withOpacity(0.38),
            disabledBackgroundColor: type.background.withOpacity(0.12),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 1),
            shadowColor: Colors.black38,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide.none,
            ),
          ),
          onPressed: isLoading ? null : onPressed,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 21, 28, 21),
            child: Text(
              label,
              style: AppTextStyle.dark16.copyWith(
                color: type.foreground,
              ),
            ),
          ),
        );
}

enum ButtonType { green, black, grey }

extension ButtonTypeExtension on ButtonType {
  Color get background {
    switch (this) {
      case ButtonType.green:
        return AppColors.red;
      case ButtonType.black:
        return AppColors.dark;
      case ButtonType.grey:
        return AppColors.textSec;
    }
  }

  Color get foreground {
    if (this == ButtonType.grey) return AppColors.dark;
    return AppColors.white;
  }
}
