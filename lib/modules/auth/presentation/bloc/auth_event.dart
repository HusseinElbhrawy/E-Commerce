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

class RegisterWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String phone;

  const RegisterWithEmailAndPasswordEvent(
    this.email,
    this.password,
    this.name,
    this.phone,
  );
  @override
  List<Object?> get props => [
        email,
        password,
        name,
        phone,
      ];
}
