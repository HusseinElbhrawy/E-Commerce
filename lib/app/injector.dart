import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/api/api_consumer.dart';
import '../core/api/app_interceptor.dart';
import '../core/api/dio_consumer.dart';
import '../core/database/i_local_data_base.dart';
import '../core/database/shared_preference.dart';
import '../core/network/network.dart';
import '../modules/auth/data/datasources/auth_local_data_source.dart';
import '../modules/auth/data/datasources/auth_remote_data_source.dart';
import '../modules/auth/data/repositories/auth_repository_implementation.dart';
import '../modules/auth/domain/repositories/auth_repository.dart';
import '../modules/auth/domain/usecases/log_out_use_case.dart';
import '../modules/auth/domain/usecases/login_with_email_and_password_use_case.dart';
import '../modules/auth/domain/usecases/register_with_email_and_password.dart';
import '../modules/auth/presentation/bloc/auth_bloc.dart';
import '../modules/home/data/datasources/home_remote_data_source.dart';
import '../modules/home/data/repositories/home_repository_implementation.dart';
import '../modules/home/domain/repositories/home_repository.dart';
import '../modules/home/domain/usecases/get_home_data_use_case.dart';
import '../modules/home/presentation/bloc/home_bloc.dart';
import '../modules/splash/data/datasources/splash_local_data_source.dart';
import '../modules/splash/data/repositories/splash_repository_implementation.dart';
import '../modules/splash/domain/repositories/splash_repository.dart';
import '../modules/splash/domain/usecases/get_user_id_use_case.dart';
import '../modules/splash/domain/usecases/is_logged_use_case.dart';
import '../modules/splash/domain/usecases/is_on_boarding_skipped_use_case.dart';
import '../modules/splash/domain/usecases/skip_on_boarding_use_case.dart';
import '../modules/splash/presentation/bloc/splash_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //Bloc
  serviceLocator.registerFactory(
    () => SplashBloc(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );
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
  serviceLocator.registerLazySingleton(
    () => GetUserIdUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => IsLoggedUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => LogOutUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => IsOnBoardingSkippedUseCase(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => SkipOnBoardingUseCase(serviceLocator()),
  );

  // Repo
  serviceLocator.registerLazySingleton<SplashRepository>(
    () => SplashRepositoryImplementation(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplementation(
      serviceLocator(),
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
  serviceLocator.registerLazySingleton<SplashLocalDataSource>(
    () => SplashLocalDataSourceImplementation(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImplementationWithApi(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImplementation(serviceLocator()),
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
    () => DioConsumer(
      dio: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<ILocalDataBase>(
    () => SharedPreferenceLocalStorageImplementation(
      shared: serviceLocator(),
    ),
  );

  //!External
  // serviceLocator.registerLazySingleton(() => SharedPreferences.getInstance());
  final sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPref);

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

  serviceLocator.registerLazySingleton(() => const FlutterSecureStorage());
}

/**
 *  final sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPref);

 */
