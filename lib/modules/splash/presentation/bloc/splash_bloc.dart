// ignore_for_file: invalid_use_of_visible_for_testing_member, use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:e_commerce_project/config/router/app_routes.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:e_commerce_project/core/utils/media_query_values.dart';
import 'package:e_commerce_project/modules/splash/domain/usecases/is_on_boarding_skipped_use_case.dart';
import 'package:e_commerce_project/modules/splash/domain/usecases/skip_on_boarding_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/enums.dart';
import '../../domain/usecases/get_user_id_use_case.dart';
import '../../domain/usecases/is_logged_use_case.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final IsLoggedUseCase _isUserLoggedUseCase;
  final GetUserIdUseCase _getUserIdUseCase;
  final IsOnBoardingSkippedUseCase _isBoardingSkippedUseCase;
  final SkipOnBoardingUseCase _skipOnBoardingUseCase;

  late Timer _timer;

  SplashBloc(
    this._getUserIdUseCase,
    this._isUserLoggedUseCase,
    this._isBoardingSkippedUseCase,
    this._skipOnBoardingUseCase,
  ) : super(const SplashState()) {
    on<IsOnBoardingSkip>((event, emit) {
      _isOnBoardingSkip(event.context);
    });

    on<SkipOnBoardingEvent>(
      (event, emit) => _skipOnBoarding(event.context),
    );

    on<IsUserLoggedEvent>(
      (event, emit) => _isUserLogged(event.context),
    );
  }

  void _isOnBoardingSkip(BuildContext context) async {
    final isOnBoardingResult = await _isBoardingSkippedUseCase(NoParams());
    final isUserLogged = await _isUserLogged(context);

    isOnBoardingResult.fold(
      (failure) {
        log(failure.toString());
      },
      (isSkipped) {
        _timer = Timer(
          Duration(seconds: AppConstant.splashTime),
          () {
            if (isSkipped) {
              if (isUserLogged) {
                context
                    .navigateToWithReplacementAndClearStack(Routes.layoutRoute);
              } else {
                context
                    .navigateToWithReplacementAndClearStack(Routes.loginRoute);
              }
            } else {
              context.navigateToWithReplacementAndClearStack(
                Routes.onboardingRoute,
              );
            }
          },
        );
      },
    );
  }

  Future<bool> _isUserLogged(BuildContext context) async {
    final result = await _isUserLoggedUseCase(NoParams());

    return result.fold(
      (failure) {
        log(failure.toString());
        return false;
      },
      (isLogged) {
        log(isLogged.toString());
        return isLogged;
      },
    );
  }

  void _skipOnBoarding(BuildContext context) async {
    final result = await _skipOnBoardingUseCase(NoParams());

    result.fold(
      (failure) {
        log(failure.toString());
      },
      (isSkipped) {
        log('_skipOnBoarding $isSkipped');
        context.navigateToWithReplacementAndClearStack(Routes.loginRoute);
      },
    );
  }

  @override
  Future<void> close() async {
    _timer.cancel();

    return super.close();
  }
}
