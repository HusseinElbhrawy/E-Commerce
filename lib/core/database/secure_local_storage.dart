import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'i_local_data_base.dart';

// abstract class SecureLocalStorage {
//   Future<String?> getData(String key);
//   Future<void> setData(String key, String value);
//   Future<void> deleteValue(String key);
//   Future<void> deleteAll();
// }

class SecureLocalStorageImplementation implements ILocalDataBase {
  final FlutterSecureStorage _flutterSecureStorage;

  SecureLocalStorageImplementation(this._flutterSecureStorage);

  @override
  Future<void> deleteAll() async {
    return await _flutterSecureStorage.deleteAll();
  }

  @override
  Future<void> deleteValue(String key) async {
    return await _flutterSecureStorage.delete(key: key);
  }

  @override
  Future<String?> getData(String key) async {
    return await _flutterSecureStorage.read(key: key);
  }

  @override
  Future<void> setData(String key, String value) async {
    return await _flutterSecureStorage.write(key: key, value: value);
  }
}
