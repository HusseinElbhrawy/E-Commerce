// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:e_commerce_project/config/router/app_routes.dart';
import 'package:e_commerce_project/modules/auth/domain/usecases/register_with_email_and_password.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_with_email_and_password_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase;
  final RegisterWithEmailAndPasswordUsecase registerWithEmailAndPasswordUsecase;

  AuthBloc(
    this.loginWithEmailAndPasswordUseCase,
    this.registerWithEmailAndPasswordUsecase,
  ) : super(const AuthState()) {
    on<AuthEvent>((event, emit) {});
    on<LoginWithEmailAndPasswordEvent>((event, emit) {
      return _loginWithEmailAndPassword(
          event.email, event.password, event.context);
    });
    on<RegisterWithEmailAndPasswordEvent>((event, emit) {
      return _registerWithEmailAndPassword(
          event.email, event.password, event.phone, event.name, event.context);
    });
    // on<IsUserLoggedInEvent>((event, emit) {
    //   return _isUserLoggedIn();
    // });
  }

  void _loginWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    // emit(LoginWithEmailAndPasswordLoading());
    emit(state.copyWith(loginState: RequestState.loading));

    final result = await loginWithEmailAndPasswordUseCase(
      LoginParams(email, password),
    );

    emit(
      result.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            loginState: RequestState.error,
            loginErrorMessage: failure.message.toString(),
          );
          // return LoginWithEmailAndPasswordError(failure.message.toString());
        },
        (response) {
          log(response.toString());
          Navigator.pushReplacementNamed(context, Routes.layoutRoute);
          return state.copyWith(loginState: RequestState.loaded);
          // return LoginWithEmailAndPasswordLoaded();
        },
      ),
    );
  }

  void _registerWithEmailAndPassword(
    String email,
    String password,
    String phone,
    String name,
    BuildContext context,
  ) async {
    final registerParams = RegisterParams(
      email: email,
      name: name,
      password: password,
      phone: phone,
    );

    // emit(RegisterWithEmailAndPasswordLoading());
    emit(state.copyWith(registerState: RequestState.loading));

    final result = await registerWithEmailAndPasswordUsecase(registerParams);
    emit(
      result.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            registerState: RequestState.error,
            registerErrorMessage: failure.message.toString(),
          );
          // return RegisterWithEmailAndPasswordError(failure.message.toString());
        },
        (response) {
          log(response.toString());
          Navigator.pushReplacementNamed(context, Routes.layoutRoute);

          // return RegisterWithEmailAndPasswordLoaded();
          return state.copyWith(registerState: RequestState.loaded);
        },
      ),
    );
  }
}
