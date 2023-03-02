import '../../domain/entities/login.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImplementation implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImplementation(this.authRemoteDataSource);
  @override
  Future<Login> loginWithEmailAndPassword(LoginParams login) async {
    final result = await authRemoteDataSource.loginWithEmailAndPassword(login);
    return result;
  }
}
