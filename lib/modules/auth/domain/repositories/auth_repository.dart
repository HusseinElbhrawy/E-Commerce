// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/core/error/failure.dart';
import 'package:e_commerce_project/modules/auth/domain/entities/register.dart';

import '../entities/login.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> loginWithEmailAndPassword(LoginParams login);

  Future<Either<Failure, Register>> registerWithEmailAndPassword(
    RegisterParams register,
  );
}

class LoginParams {
  final String email;
  final String password;

  LoginParams(this.email, this.password);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginParams.fromMap(Map<String, dynamic> map) {
    return LoginParams(
      map['email'] as String,
      map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginParams.fromJson(String source) =>
      LoginParams.fromMap(json.decode(source) as Map<String, dynamic>);
}

class RegisterParams {
  final String email;
  final String password;
  final String phone;
  final String name;
  RegisterParams({
    required this.email,
    required this.password,
    required this.phone,
    required this.name,
  });

  RegisterParams copyWith({
    String? email,
    String? password,
    String? phone,
    String? name,
  }) {
    return RegisterParams(
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'phone': phone,
      'name': name,
    };
  }

  factory RegisterParams.fromMap(Map<String, dynamic> map) {
    return RegisterParams(
      email: map['email'] as String,
      password: map['password'] as String,
      phone: map['phone'] as String,
      name: map['name'] as String,
    );
  }
}
