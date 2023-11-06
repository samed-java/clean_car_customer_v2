import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../generated/l10n.dart';

extension LocaleExtension on BuildContext {
  S get locale => S.of(this);

  List<Locale> get supportedLocales => S.delegate.supportedLocales;
  
  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegate => const [
              S.delegate,
              AppLocalizationDelegate(),
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ];
}
