import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_point.dart';
import '../models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getHomeData();
}

class HomeRemoteDataSourceImplementation implements HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceImplementation(this.apiConsumer);
  @override
  Future<HomeModel> getHomeData() async {
    final response = await apiConsumer.get(EndPoint.home);
    return HomeModel.fromJson(response.data);
  }
}
