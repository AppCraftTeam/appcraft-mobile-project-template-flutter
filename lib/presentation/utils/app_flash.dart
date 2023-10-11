import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../../app/generated/l10n.dart';
import '../theme/app_theme.dart';
import 'constants.dart';

DefaultFlashController<void>? _previousController;

class AppFlash {
  // TODO Change flash error style
  static Future<void>? bigToast({
    required BuildContext context,
    required String message,
    String? buttonLabel,
    VoidCallback? onPressed,
  }) {
    if (_previousController?.isDisposed == false) {
      _previousController?.dismiss();
    }

    final oneLiner = message.length <= 15;
    return showFlash(
      context: context,
      builder: (context, controller) {
        _previousController =
            controller is DefaultFlashController ? controller : null;

        final action = TextButton(
          onPressed: () {
            onPressed!();
            controller.dismiss();
          },
          child:
              Text(buttonLabel ?? S.current.retry, style: AppTextStyle.bold14),
        );

        return GestureDetector(
          onTap: controller.dismiss,
          child: FlashBar(
              controller: controller,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: AppColors.dark3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              forwardAnimationCurve: Curves.easeInCirc,
              reverseAnimationCurve: Curves.easeInCirc,
              padding: EdgeInsets.fromLTRB(
                  16, 16, 16, onPressed == null || oneLiner ? 16 : 0),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(message, style: AppTextStyle.dark18),
                  if (oneLiner) action,
                ],
              ),
              actions: [
                if (!oneLiner && onPressed != null) ...[
                  action,
                  const SizedBox(width: 4)
                ]
              ]),
        );
      },
      duration: kToastDuration,
    );
  }

  static Future<void>? toast({
    required BuildContext context,
    required String message,
  }) {
    if (_previousController?.isDisposed == false) {
      _previousController?.dismiss();
    }

    return showFlash(
      context: context,
      builder: (context, controller) {
        _previousController =
            controller is DefaultFlashController ? controller : null;

        return GestureDetector(
          onTap: controller.dismiss,
          child: FlashBar(
            controller: controller,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: AppColors.dark3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            forwardAnimationCurve: Curves.easeInCirc,
            reverseAnimationCurve: Curves.easeInCirc,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            content: Text(message, style: AppTextStyle.dark18),
          ),
        );
      },
      duration: kToastDuration,
    );
  }
}
