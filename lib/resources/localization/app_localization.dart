import 'package:flutter/material.dart';

import 'app_localizations.dart';
import 'app_localizations_en.dart';

extension AppLocalization on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this) ?? AppLocalizationsEn();
}