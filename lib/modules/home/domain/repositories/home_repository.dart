import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/home.dart';

abstract class HomeRepository {
  Future<Either<Failure, Home>> getHomeData();
}
