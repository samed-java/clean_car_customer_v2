import 'dart:io';

import 'package:clean_car_customer_v2/data/services/local/storage_service.dart';
import 'package:clean_car_customer_v2/locator.dart';
import 'package:clean_car_customer_v2/utils/dynamic_constants/data/model/response/regions_response_model.dart';
import 'package:clean_car_customer_v2/utils/dynamic_constants/repo/regions_repository.dart';
import 'package:clean_car_customer_v2/utils/language/data/model/response/language_response_model.dart';
import 'package:clean_car_customer_v2/utils/language/repo/language_repository.dart';

class InitializeRegions {
  InitializeRegions._();
  static final StorageService _storageService = locator.get<StorageService>();
  static Future<void> _fetch() async {
    var repo = locator.get<RegionsRepository>();
    var data = await repo.fetch();
    if (data != null) {
      _storageService.setLang(data.toJson());
    } else {
      throw Exception("Language not found");
    }
  }

  static void init() async {
    if (await _storageService.hasLang) {
      RegionsResModel regions =
          RegionsResModel.fromJson(_storageService.getRegions()!);
      locator.registerSingleton<RegionsResModel>(regions);
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
