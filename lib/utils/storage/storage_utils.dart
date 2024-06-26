import 'package:get_storage/get_storage.dart';
import 'package:tasker/app/data/models/response/app_config_response.dart';

class Storage {
  Storage._privateConstructor();
  static final _box = GetStorage();

  static AppConfig getAppConfig() => AppConfig.fromJson(_box.read(StorageKeys.APP_CONFIG));

  static void setAppConfig(AppConfig appConfig) => _box.write(StorageKeys.APP_CONFIG, appConfig.toJson());

  static Map<String, dynamic>? getUser() => _box.read(StorageKeys.USER);

  static void setUser(Map<String, dynamic>? user) => _box.write(StorageKeys.USER, user);

  static bool isUserExists() => _box.read(StorageKeys.USER) != null;

  static clearUser() => _box.remove(StorageKeys.USER);
}

class StorageKeys {
  StorageKeys._privateConstructor();

  static const APP_CONFIG = 'app_config';
  static const USER = 'user';
}
