import 'package:dartz/dartz.dart';

import '../../../../../../../../core/error/failure.dart';
import '../../../../../../../../core/usecase/usecase.dart';
import '../repositories/splash_repository.dart';

class GetUserIdUseCase extends Usecase<String, NoParams> {
  final SplashRepository _splashRepository;

  GetUserIdUseCase(this._splashRepository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await _splashRepository.getUid();
  }
}
