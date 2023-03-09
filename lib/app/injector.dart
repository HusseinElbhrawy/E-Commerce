import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/api/api_consumer.dart';
import '../core/api/app_interceptor.dart';
import '../core/api/dio_consumer.dart';
import '../core/network/network.dart';
import '../modules/auth/data/datasources/auth_remote_data_source.dart';
import '../modules/auth/data/repositories/auth_repository_implementation.dart';
import '../modules/auth/domain/repositories/auth_repository.dart';
import '../modules/auth/domain/usecases/login_with_email_and_password_use_case.dart';
import '../modules/auth/domain/usecases/register_with_email_and_password.dart';
import '../modules/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

void setup() {
  //Bloc
  serviceLocator.registerFactory(
    () => AuthBloc(
      serviceLocator(),
      serviceLocator(),
    ),
  );

  // useCase
  serviceLocator.registerLazySingleton(
    () => LoginWithEmailAndPasswordUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => RegisterWithEmailAndPasswordUsecase(serviceLocator()),
  );

  // Repo
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplementation(
      serviceLocator(),
      serviceLocator(),
    ),
  );
  // DataSource
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImplementationWithApi(serviceLocator()),
  );
  // Utils

  serviceLocator.registerLazySingleton<NetworkInformation>(
    () => NetworkInformationImplementation(
      internetConnectionChecker: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(dio: serviceLocator()));

  //!External
  serviceLocator.registerLazySingleton(() => AppInterceptor());
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      error: true,
      responseBody: true,
      responseHeader: true,
    ),
  );
  serviceLocator.registerLazySingleton(() => Dio());

  serviceLocator.registerLazySingleton(
    () => DioConsumer(
      dio: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
}
