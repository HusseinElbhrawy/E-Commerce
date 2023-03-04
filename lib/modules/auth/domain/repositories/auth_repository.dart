// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/login.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> loginWithEmailAndPassword(LoginParams login);
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginParams.fromMap(Map<String, dynamic> map) {
    return LoginParams(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
