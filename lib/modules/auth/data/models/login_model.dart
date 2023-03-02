// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import '../../domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.status,
    required super.message,
    required super.data,
  });

  LoginModel copyWith({
    bool? status,
    String? message,
    LoginDataModel? data,
  }) {
    return LoginModel(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      status: map['status'] as bool,
      message: map['message'] as String,
      data: LoginDataModel.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class LoginDataModel extends LoginData {
  const LoginDataModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.image,
    required super.email,
    required super.token,
  });

  LoginDataModel copyWith({
    int? id,
    String? name,
    String? phone,
    String? image,
    String? email,
    String? token,
  }) {
    return LoginDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'image': image,
      'email': email,
      'token': token,
    };
  }

  factory LoginDataModel.fromMap(Map<String, dynamic> map) {
    return LoginDataModel(
      id: map['id'] as int,
      name: map['name'] as String,
      phone: map['phone'] as String,
      image: map['image'] as String,
      email: map['email'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDataModel.fromJson(String source) =>
      LoginDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LoginDataModel(id: $id, name: $name, phone: $phone, image: $image, email: $email, token: $token)';
  }

  @override
  bool operator ==(covariant LoginDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.image == image &&
        other.email == email &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        image.hashCode ^
        email.hashCode ^
        token.hashCode;
  }
}
