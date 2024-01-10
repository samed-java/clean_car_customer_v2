import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/language/data/model/response/language_response_model.dart';
import 'package:clean_car_customer_v2/utils/language/language_init.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../generated/l10n.dart';

extension LocaleExtension on BuildContext {
    void get initLocalization => InitializeLanguage.init();
    Future<void> changeOrRefreshLang() async => await InitializeLanguage.changeOrRefreshLang();
    CustomerLangData get locale => locator.get<CustomerLangData>();
}
