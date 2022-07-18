// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// final sharedPreferencesServiceProvider = Provider<SharedPreferencesService>((ref) => throw UnimplementedError());
//
// class SharedPreferencesService {
//   SharedPreferencesService(this.sharedPreferences);
//   final SharedPreferences sharedPreferences;
//
//   Future<void> setString(String key, String value) async {
//     await sharedPreferences.setString(key, value);
//   }
//
//   String? getString(String key) {
//     return sharedPreferences.getString(key);
//   }
//
//   Future<void> setBool(String key, bool value) async {
//     await sharedPreferences.setBool(key, value);
//   }
//
//   bool? getBool(String key) {
//     return sharedPreferences.getBool(key);
//   }
// }