import '../entities/login.dart';
import '../repositories/auth_repository.dart';

class LoginWithEmailAndPasswordUseCase {
  final AuthRepository authRepository;

  LoginWithEmailAndPasswordUseCase(this.authRepository);

  Future<Login> loginWithEmailAndPasswordUseCase(LoginParams login) async {
    return await authRepository.loginWithEmailAndPassword(login);
  }
}
