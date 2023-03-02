part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginWithEmailAndPasswordLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginWithEmailAndPasswordLoaded extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginWithEmailAndPasswordError extends AuthState {
  final String message;

  const LoginWithEmailAndPasswordError(this.message);
  @override
  List<Object?> get props => [message];
}
