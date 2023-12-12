import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../../constants/keys/strorage_keys.dart';

class StorageService {
  final instance = GetStorage();

  void init() {
    GetStorage.init();
  }

  // void _set<T>(String key, T value) async {
  //   await instance.write(key, value);
  // }
  //
  // T? _get<T>(String key) {
  //   return instance.read<T>(key);
  // }

  // void _delete(String key) async {
  //   instance.remove(key);
  // }

  Future<void> setAccessToken([String? token]) async {
    if (token != null) {
      await instance.write(StorageKeys.accessToken, token);
    } else {
      await instance.remove(StorageKeys.accessToken);
    }
  }

  String? getAccessToken() {
    return instance.read<String>(StorageKeys.accessToken);
  }

  Future<void> setPhoneNumber([String? number]) async {
    if (number != null) {
      await instance.write(StorageKeys.number, number);
    } else {
      await instance.remove(StorageKeys.number);
    }
  }

  String? getPhoneNumber() {
    return instance.read<String>(StorageKeys.number);
  }

  Future<void> setLang(Map<String, dynamic> lang) async {
    await instance.write(StorageKeys.lang, json.encode(lang));
  }

  Future<bool> get hasLang async {
    return (await instance.read(StorageKeys.lang)) != null;
  }

  Map<String, dynamic>? getLang() {
    var data = instance.read<String>(StorageKeys.lang);
    if (data != null) {
      return json.decode(data);
    } else {
      throw Exception("Languages not initialized");
    }
  }

  Future<void> setRegions(Map<String, dynamic> lang) async {
    await instance.write(StorageKeys.regions, json.encode(lang));
  }

  Future<bool> get hasRegions async {
    return (await instance.read(StorageKeys.regions)) != null;
  }

  Map<String, dynamic>? getRegions() {
    var data = instance.read<String>(StorageKeys.regions);
    if (data != null) {
      return json.decode(data);
    } else {
      throw Exception("Languages not initialized");
    }
  }

  Future<void> setOtpToken([String? token]) async {
    if (token != null) {
      await instance.write(StorageKeys.otpToken, token);
    } else {
      await instance.remove(StorageKeys.otpToken);
    }
  }

  String? getOtpToken() {
    return instance.read<String>(StorageKeys.otpToken);
  }

  // Future<void> setRole(Roles role) async {
  //   await instance.write(StorageKeys.role, role.role);
  // }
  //
  // String get role {
  //   return instance.read<String>(StorageKeys.role)!;
  // }

  void setRefreshToken([String? token]) async {
    if (token != null) {
      await instance.write(StorageKeys.refreshToken, token);
    } else {
      await instance.remove(StorageKeys.refreshToken);
    }
  }

  String? getRefreshToken() {
    return instance.read<String>(StorageKeys.refreshToken);
  }
}
