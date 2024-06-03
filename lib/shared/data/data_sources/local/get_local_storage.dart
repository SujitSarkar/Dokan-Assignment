import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final box = GetStorage();

  static Future<void> saveData(
      {required String key, required dynamic data}) async {
    await box.write(key, data);
  }

  static Future<dynamic> getData({required String key}) async {
    final data = await box.read(key);
    return data;
  }

  static Future<void> removeData({required String key}) async {
    await box.remove(key);
  }

  static Future<void> clearAll() async {
    await box.erase();
  }
}
