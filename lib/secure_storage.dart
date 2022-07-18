import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) => throw UnimplementedError());

class SecureStorageService {
  SecureStorageService(this.storage);
  final FlutterSecureStorage storage;

  Future<void> setString(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<void> deleteString(String key) async {
    await storage.delete(key: key);
  }

  Future<String?> getString(String key) async {
    return await storage.read(key: key);
  }
  // Future<void> setBool(String key, bool value) async {
  //   await sharedPreferences.setBool(key, value);
  // }
  //
  // bool? getBool(String key) {
  //   return sharedPreferences.getBool(key);
  // }
}