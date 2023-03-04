// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_implementation.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_with_email_and_password_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<LoginWithEmailAndPasswordEvent>((event, emit) {
      return _loginWithEmailAndPassword(event.email, event.password);
    });
  }

  void _loginWithEmailAndPassword(String email, String password) async {
    final AuthRemoteDataSource authRemoteDataSource =
        AuthRemoteDataSourceImplementationWithApi(
      DioConsumer(
        dio: Dio(),
      ),
    );

    final AuthRepository authRepository =
        AuthRepositoryImplementation(authRemoteDataSource);

    final LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase =
        LoginWithEmailAndPasswordUseCase(authRepository);

    emit(LoginWithEmailAndPasswordLoading());

    final result = await loginWithEmailAndPasswordUseCase(
      LoginParams(email: email, password: password),
    );

    emit(
      result.fold(
        (failure) {
          log(failure.toString());
          return LoginWithEmailAndPasswordError(failure.message.toString());
        },
        (response) {
          log(response.toString());
          return LoginWithEmailAndPasswordLoaded();
        },
      ),
    );
  }
}
