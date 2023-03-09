import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../app/injector.dart';
import '../error/exceptions.dart';
import 'api_consumer.dart';
import 'app_interceptor.dart';
import 'status_code.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.interceptors.add(serviceLocator<AppInterceptor>());
    if (kDebugMode) dio.interceptors.add(serviceLocator<LogInterceptor>());
  }

  @override
  Future<Response> get(String endPoint, {Map<String, dynamic>? query}) async {
    try {
      final response = await dio.get(endPoint);
      return response;
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future<Response> post(String endPoint,
      {Map<String, dynamic>? query, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.post(
        endPoint,
        queryParameters: query,
        data: body,
      );
      return response;
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future<Response> put(String endPoint,
      {Map<String, dynamic>? query, Map<String, dynamic>? body}) async {
    try {
      final response = await dio.put(
        endPoint,
        queryParameters: query,
        data: body,
      );

      return response;
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();

      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internetServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        throw const CancelRequestException();
      case DioErrorType.unknown:
        throw const UnknownException();
      case DioErrorType.badCertificate:
        throw const BadCertificateException();
      case DioErrorType.connectionError:
        throw const NoInternetConnectionException();
    }
  }
}
