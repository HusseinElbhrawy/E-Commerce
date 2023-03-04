import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/login.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImplementation(this.authRemoteDataSource);

  @override
  Future<Either<Failure, Login>> loginWithEmailAndPassword(
    LoginParams login,
  ) async {
    try {
      final result =
          await authRemoteDataSource.loginWithEmailAndPassword(login);
      if (result.status == true) {
        return Right(result);
      } else {
        return Left(Failure(result.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
