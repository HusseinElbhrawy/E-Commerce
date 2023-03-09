// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/home.dart';
import '../../domain/usecases/get_home_data_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  HomeBloc(
    this.getHomeDataUseCase,
  ) : super(const HomeState()) {
    on<HomeEvent>((event, emit) {});
    on<GetHomeDateEvent>((event, emit) {
      return _getHomeData();
    });
  }

  void _getHomeData() async {
    emit(state.copyWith(state: RequestState.loading));

    final result = await getHomeDataUseCase(NoParams());

    emit(
      result.fold(
        (failure) {
          log(failure.toString());
          return state.copyWith(
            state: RequestState.error,
            errorMessage: failure.message.toString(),
          );
        },
        (home) {
          log(home.toString());

          return state.copyWith(state: RequestState.loaded, data: home);
        },
      ),
    );
  }
}
