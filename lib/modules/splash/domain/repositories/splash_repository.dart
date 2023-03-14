import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class SplashRepository {
  Future<Either<Failure, bool>> isLogged();
  Future<Either<Failure, bool>> isOnBoardingSkipped();
  Future<Either<Failure, String>> getUid();
  Future<Either<Failure, bool>> skipOnBoarding();
}
