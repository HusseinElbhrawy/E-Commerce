import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/login.dart';
import '../repositories/auth_repository.dart';

class LoginWithEmailAndPasswordUseCase extends Usecase<Login, LoginParams> {
  final AuthRepository authRepository;

  LoginWithEmailAndPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, Login>> call(LoginParams params) async {
    return authRepository.loginWithEmailAndPassword(params);
  }
}
