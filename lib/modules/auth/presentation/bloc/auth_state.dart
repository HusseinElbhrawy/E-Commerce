// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.loginState = RequestState.loaded,
    this.registerState = RequestState.loaded,
    this.loginErrorMessage = '',
    this.registerErrorMessage = '',
  });
  final RequestState loginState;
  final String loginErrorMessage;
  final RequestState registerState;
  final String registerErrorMessage;

  @override
  List<Object?> get props => [
        loginState,
        registerState,
        loginErrorMessage,
        registerErrorMessage,
      ];

  AuthState copyWith({
    RequestState? loginState,
    String? loginErrorMessage,
    RequestState? registerState,
    String? registerErrorMessage,
  }) {
    return AuthState(
      loginState: loginState ?? this.loginState,
      loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
      registerState: registerState ?? this.registerState,
      registerErrorMessage: registerErrorMessage ?? this.registerErrorMessage,
    );
  }
}

// class AuthInitial extends AuthState {
//   @override
//   List<Object?> get props => [];
// }

// class LoginWithEmailAndPasswordLoading extends AuthState {
//   @override
//   List<Object?> get props => [];
// }

// class LoginWithEmailAndPasswordLoaded extends AuthState {
//   @override
//   List<Object?> get props => [];
// }

// class LoginWithEmailAndPasswordError extends AuthState {
//   final String message;

//   const LoginWithEmailAndPasswordError(this.message);
//   @override
//   List<Object?> get props => [message];
// }

// class RegisterWithEmailAndPasswordLoading extends AuthState {
//   @override
//   List<Object?> get props => [];
// }

// class RegisterWithEmailAndPasswordLoaded extends AuthState {
//   @override
//   List<Object?> get props => [];
// }

// class RegisterWithEmailAndPasswordError extends AuthState {
//   final String message;

//   const RegisterWithEmailAndPasswordError(this.message);
//   @override
//   List<Object?> get props => [message];
// }
