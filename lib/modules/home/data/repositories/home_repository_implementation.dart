import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/home.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImplementation(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, Home>> getHomeData() async {
    try {
      final homeData = await homeRemoteDataSource.getHomeData();
      log(homeData.toString());
      return Right(homeData);
    } on ServerException catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.message.toString()));
    } catch (error) {
      log(error.toString());
      return Left(ServerFailure(error.toString()));
    }
  }
}
