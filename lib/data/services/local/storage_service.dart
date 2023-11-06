
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
