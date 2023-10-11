import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../app/env/env.dart';
import '../../app/generated/l10n.dart';
import '../theme/app_theme.dart';
import '../utils/safe_launch.dart';

class AgreementsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyle.agreementText,
        children: [
          TextSpan(text: S.current.agreementStart),
          TextSpan(
            text: S.current.agreementUserTerms,
            style: AppTextStyle.agreementLink,
            recognizer: TapGestureRecognizer()
              ..onTap = () async => Link.safeLaunch(
                  '${Env.value.baseUrl}${S.current.userAgreementLink}'),
          ),
          TextSpan(text: S.current.agreementAnd),
          TextSpan(
            text: S.current.agreementPrivacyPolicy,
            style: AppTextStyle.agreementLink,
            recognizer: TapGestureRecognizer()
              ..onTap = () async => Link.safeLaunch(
                  '${Env.value.baseUrl}${S.current.privacyPolicyLink}'),
          ),
        ],
      ),
    );
  }
}
