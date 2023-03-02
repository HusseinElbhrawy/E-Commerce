part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginWithEmailAndPasswordEvent(this.email, this.password);
  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
