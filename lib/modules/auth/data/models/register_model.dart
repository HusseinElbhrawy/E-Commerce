// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/register.dart';

class RegisterModel extends Register {
  RegisterModel({
    required super.status,
    required super.message,
    required super.data,
  });

  RegisterModel copyWith({
    bool? status,
    String? message,
    RegisterModelData? data,
  }) {
    return RegisterModel(
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

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      status: map['status'] as bool,
      message: map['message'] as String,
      data: map['data'] != null
          ? RegisterModelData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RegisterModel(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class RegisterModelData extends RegisterData {
  RegisterModelData({
    required super.name,
    required super.email,
    required super.phone,
    required super.id,
    required super.token,
    required super.image,
  });

  RegisterModelData copyWith({
    String? name,
    String? email,
    String? phone,
    int? id,
    String? token,
    String? image,
  }) {
    return RegisterModelData(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      id: id ?? this.id,
      token: token ?? this.token,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'id': id,
      'token': token,
      'image': image,
    };
  }

  factory RegisterModelData.fromMap(Map<String, dynamic> map) {
    return RegisterModelData(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      id: map['id'] as int,
      token: map['token'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModelData.fromJson(String source) =>
      RegisterModelData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModelData(name: $name, email: $email, phone: $phone, id: $id, token: $token, image: $image)';
  }

  @override
  bool operator ==(covariant RegisterModelData other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.id == id &&
        other.token == token &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        id.hashCode ^
        token.hashCode ^
        image.hashCode;
  }
}
