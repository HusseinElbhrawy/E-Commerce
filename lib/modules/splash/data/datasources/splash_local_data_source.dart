import 'package:dartz/dartz.dart';

import '../../../../core/database/i_local_data_base.dart';

abstract class SplashLocalDataSource {
  Future<bool?> isLogged();
  Future<String?> getUid();
  Future<bool?> isOnBoardingSkipped();
  Future<bool?> skipOnBoarding();
}

class SplashLocalDataSourceImplementation implements SplashLocalDataSource {
  final ILocalDataBase _localDataBase;

  SplashLocalDataSourceImplementation(this._localDataBase);

  @override
  Future<String?> getUid() async {
    return await _localDataBase.getData('login') ?? '';
  }

  @override
  Future<bool?> isLogged() async {
    return await _localDataBase.getData('login') != null;
  }

  @override
  Future<bool?> isOnBoardingSkipped() async {
    return await _localDataBase.getData('onBoarding') != null;
  }

  @override
  Future<bool?> skipOnBoarding() async {
    return await _localDataBase.setData('onBoarding', true.toString()) ?? unit;
  }
}
