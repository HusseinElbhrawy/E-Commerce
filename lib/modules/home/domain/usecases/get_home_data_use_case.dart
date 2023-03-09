// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/core/error/failure.dart';
import 'package:e_commerce_project/modules/home/domain/repositories/home_repository.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/home.dart';

class GetHomeDataUseCase extends Usecase<Home, NoParams> {
  final HomeRepository homeRepository;
  GetHomeDataUseCase({
    required this.homeRepository,
  });
  @override
  Future<Either<Failure, Home>> call(NoParams params) async {
    return await homeRepository.getHomeData();
  }
}
