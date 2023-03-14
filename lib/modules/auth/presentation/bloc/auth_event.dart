part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  const LoginWithEmailAndPasswordEvent(
    this.email,
    this.password,
    this.context,
  );
  @override
  List<Object?> get props => [
        email,
        password,
        context,
      ];
}

class RegisterWithEmailAndPasswordEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String phone;
  final BuildContext context;

  const RegisterWithEmailAndPasswordEvent(
    this.email,
    this.password,
    this.name,
    this.phone,
    this.context,
  );
  @override
  List<Object?> get props => [email, password, name, phone, context];
}

class IsUserLoggedInEvent extends AuthEvent {
  const IsUserLoggedInEvent();
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
  @override
  List<Object?> get props => [];
}

class GetUserIdEvent extends AuthEvent {
  const GetUserIdEvent();
  @override
  List<Object?> get props => [];
}
