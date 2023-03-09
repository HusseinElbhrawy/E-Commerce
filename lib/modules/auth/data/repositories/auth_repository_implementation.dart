import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/register.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInformation networkInformation;

  AuthRepositoryImplementation(
    this.authRemoteDataSource,
    this.networkInformation,
  );

  @override
  Future<Either<Failure, Login>> loginWithEmailAndPassword(
    LoginParams login,
  ) async {
    if (await networkInformation.isConnected) {
      try {
        final result =
            await authRemoteDataSource.loginWithEmailAndPassword(login);
        if (result.status == true) {
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
    if (await networkInformation.isConnected) {
      try {
        final result =
            await authRemoteDataSource.registerWithEmailAndPassword(register);
        if (result.status == false) {
          return Left(ServerFailure(result.message));
        } else {
          return Right(result);
        }
      } catch (e) {
        log('Error in Auth Repo$e');
        return Left(ServerFailure(e.toString()));
      }
    }
    return const Left(NoInternetFailure());
  }
}
