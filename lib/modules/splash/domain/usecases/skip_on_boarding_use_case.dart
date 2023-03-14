import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/splash_repository.dart';

class SkipOnBoardingUseCase extends Usecase<bool, NoParams> {
  final SplashRepository _splashRepository;

  SkipOnBoardingUseCase(this._splashRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _splashRepository.skipOnBoarding();
  }
}
