import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/api/end_point.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> loginWithEmailAndPassword(LoginParams login);
}

class AuthRemoteDataSourceImplementationWithApi extends AuthRemoteDataSource {
  final DioConsumer dioConsumer;

  AuthRemoteDataSourceImplementationWithApi(this.dioConsumer);

  @override
  Future<LoginModel> loginWithEmailAndPassword(LoginParams login) async {
    final response = await dioConsumer.post(
      EndPoint.login,
      body: login.toMap(),
    );
    return LoginModel.fromJson(response.data);
  }
}
