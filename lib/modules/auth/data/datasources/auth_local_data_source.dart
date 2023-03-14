import '../../../../core/database/i_local_data_base.dart';

abstract class AuthLocalDataSource {
  Future<bool> cacheLogin(String uid);
  Future<bool> cacheRegister(String uid);
  Future<bool> cacheLogout();
}

class AuthLocalDataSourceImplementation implements AuthLocalDataSource {
  final ILocalDataBase _localDataBase;

  AuthLocalDataSourceImplementation(this._localDataBase);

  @override
  Future<bool> cacheLogin(String uid) async {
    return await _localDataBase.setData('login', uid);
  }

  @override
  Future<bool> cacheLogout() async {
    return await _localDataBase.deleteValue('login');
  }

  @override
  Future<bool> cacheRegister(String uid) async {
    return await _localDataBase.setData('register', uid);
  }
}
