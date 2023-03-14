import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/register.dart';
import '../repositories/auth_repository.dart';

class RegisterWithEmailAndPasswordUsecase
    extends Usecase<Register, RegisterParams> {
  final AuthRepository _authRepository;

  RegisterWithEmailAndPasswordUsecase(this._authRepository);
  @override
  Future<Either<Failure, Register>> call(RegisterParams params) async {
    return await _authRepository.registerWithEmailAndPassword(params);
  }
}
