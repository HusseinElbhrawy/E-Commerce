// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_bloc.dart';

class SplashState extends Equatable {
  const SplashState({
    this.isUserLoggedInState = RequestState.initial,
    this.getUserNameState = RequestState.initial,
    this.isUserLoggedInErrorMessage = '',
  });
  final RequestState isUserLoggedInState;
  final RequestState getUserNameState;
  final String isUserLoggedInErrorMessage;
  @override
  List<Object> get props => [
        isUserLoggedInState,
        isUserLoggedInErrorMessage,
      ];

  SplashState copyWith({
    RequestState? isUserLoggedInState,
    RequestState? getUserNameState,
    String? isUserLoggedInErrorMessage,
  }) {
    return SplashState(
      isUserLoggedInState: isUserLoggedInState ?? this.isUserLoggedInState,
      getUserNameState: getUserNameState ?? this.getUserNameState,
      isUserLoggedInErrorMessage:
          isUserLoggedInErrorMessage ?? this.isUserLoggedInErrorMessage,
    );
  }
}
