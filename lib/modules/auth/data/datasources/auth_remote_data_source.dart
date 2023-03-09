import '../../../../../core/api/end_point.dart';
import '../../../../core/api/api_consumer.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> loginWithEmailAndPassword(LoginParams login);
  Future<RegisterModel> registerWithEmailAndPassword(RegisterParams register);
}

class AuthRemoteDataSourceImplementationWithApi extends AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImplementationWithApi(this.apiConsumer);

  @override
  Future<LoginModel> loginWithEmailAndPassword(LoginParams login) async {
    final response = await apiConsumer.post(
      EndPoint.login,
      body: login.toMap(),
    );
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<RegisterModel> registerWithEmailAndPassword(
      RegisterParams register) async {
    final response = await apiConsumer.post(
      EndPoint.register,
      body: register.toMap(),
    );
    return RegisterModel.fromJson(response.data);
  }
}
