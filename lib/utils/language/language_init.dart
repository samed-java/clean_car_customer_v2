import 'dart:io';

import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/language/data/model/response/language_response_model.dart';
import 'package:clean_car_customer_v2/utils/language/repo/language_repository.dart';

class InitializeLanguage {
  InitializeLanguage._();
  static final StorageService _storageService = locator.get<StorageService>();
  static Future<void> _fetch() async {
    var repo = locator.get<LanguageRepository>();
    var data = await repo.fetch();
    if (data != null) {
      _storageService.setLang(data.words.customer.toJson());
    } else {
      throw Exception("Language not found");
    }
  }

  static void init() async {
    if (await _storageService.hasLang) {
      CustomerLangData lang =
          CustomerLangData.fromJson(_storageService.getLang()!);
      locator.registerSingleton<CustomerLangData>(lang);
    } else {
      await _fetch();
      init();
    }
  }

  static void changeOrRefreshLang({String? langCode}) async {
    await _fetch();
    locator.unregister<CustomerLangData>();
    init();
  }
}
