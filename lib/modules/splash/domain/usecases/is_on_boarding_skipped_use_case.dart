import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/splash_repository.dart';

class IsOnBoardingSkippedUseCase extends Usecase<bool, NoParams> {
  final SplashRepository _splashRepository;

  IsOnBoardingSkippedUseCase(this._splashRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _splashRepository.isOnBoardingSkipped();
  }
}
