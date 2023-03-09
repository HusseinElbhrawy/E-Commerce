// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.state = RequestState.loaded,
    this.data = const Home(status: false),
    this.errorMessage = '',
  });

  final RequestState state;
  final String errorMessage;
  final Home data;

  @override
  List<Object> get props => [
        state,
        data,
        errorMessage,
      ];

  HomeState copyWith({
    RequestState? state,
    String? errorMessage,
    Home? data,
  }) {
    return HomeState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }
}
