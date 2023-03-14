import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/splash_repository.dart';
import '../datasources/splash_local_data_source.dart';

class SplashRepositoryImplementation implements SplashRepository {
  final SplashLocalDataSource _splashLocalDataSource;

  SplashRepositoryImplementation(this._splashLocalDataSource);

  @override
  Future<Either<Failure, String>> getUid() async {
    try {
      final result = await _splashLocalDataSource.getUid();
      return Right(result!);
    } on CachedException catch (error) {
      return Left(CacheFailure(error.toString()));
    } catch (e) {
      log('Error in Auth Repo$e');
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isLogged() async {
    try {
      final result = await _splashLocalDataSource.isLogged();
      return Right(result!);
    } on CachedException catch (error) {
      return Left(CacheFailure(error.toString()));
    } catch (e) {
      log('Error in Auth Repo$e');
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isOnBoardingSkipped() async {
    try {
      final result = await _splashLocalDataSource.isOnBoardingSkipped();
      return Right(result!);
    } on CachedException catch (error) {
      return Left(CacheFailure(error.toString()));
    } catch (e) {
      log('Error in Auth Repo$e');
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> skipOnBoarding() async {
    try {
      final result = await _splashLocalDataSource.skipOnBoarding();
      return Right(result ?? false);
    } on CachedException catch (error) {
      log(error.toString());

      return Left(CacheFailure(error.toString()));
    } catch (e) {
      log('Error in Auth Repo in skipOnBoarding $e');
      return Left(CacheFailure(e.toString()));
    }
  }
}
