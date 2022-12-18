import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStore {
  static const storage = FlutterSecureStorage();

  static void save(String key, String value) async {
    await storage.write(key: key, value: value);
    print("Saved $key: $value");
  }

  static Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  static Future<void> delete(String key) async {
    await storage.delete(key: key);
  }
}
