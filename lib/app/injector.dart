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
import '../modules/home/data/datasources/home_remote_data_source.dart';
import '../modules/home/data/repositories/home_repository_implementation.dart';
import '../modules/home/domain/repositories/home_repository.dart';
import '../modules/home/domain/usecases/get_home_data_use_case.dart';
import '../modules/home/presentation/bloc/home_bloc.dart';

final serviceLocator = GetIt.instance;

void setup() {
  //Bloc
  serviceLocator.registerFactory(
    () => AuthBloc(
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => HomeBloc(
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
  serviceLocator.registerLazySingleton(
    () => GetHomeDataUseCase(homeRepository: serviceLocator()),
  );

  // Repo
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplementation(
      serviceLocator(),
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImplementation(
      serviceLocator(),
    ),
  );
  // DataSource
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImplementationWithApi(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImplementation(serviceLocator()),
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
