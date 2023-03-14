import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/register.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final NetworkInformation _networkInformation;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImplementation(
    this._authRemoteDataSource,
    this._networkInformation,
    this._authLocalDataSource,
  );

  @override
  Future<Either<Failure, Login>> loginWithEmailAndPassword(
    LoginParams login,
  ) async {
    if (await _networkInformation.isConnected) {
      try {
        final result =
            await _authRemoteDataSource.loginWithEmailAndPassword(login);
        if (result.status == true) {
          var cached =
              await _authLocalDataSource.cacheLogin(result.data!.token);
          log(cached.toString());

          return Right(result);
        } else {
          return Left(ServerFailure(result.message));
        }
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    }
    return const Left(NoInternetFailure());
  }

  @override
  Future<Either<Failure, Register>> registerWithEmailAndPassword(
      RegisterParams register) async {
    if (await _networkInformation.isConnected) {
      try {
        final result =
            await _authRemoteDataSource.registerWithEmailAndPassword(register);
        if (result.status == false) {
          return Left(ServerFailure(result.message));
        } else {
          var cached =
              await _authLocalDataSource.cacheLogin(result.data!.token);
          log(cached.toString());

          return Right(result);
        }
      } catch (e) {
        log('Error in Auth Repo$e');
        return Left(ServerFailure(e.toString()));
      }
    }
    return const Left(NoInternetFailure());
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final result = await _authLocalDataSource.cacheLogout();
      return Right(result);
    } on CachedException catch (error) {
      return Left(CacheFailure(error.toString()));
    } catch (e) {
      log('Error in Auth Repo$e');
      return Left(CacheFailure(e.toString()));
    }
  }
}
