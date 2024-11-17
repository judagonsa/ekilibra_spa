part of 'home_bloc.dart';

@freezed
class HomeState {
  final List<Service>? services;

  HomeState({
    required this.services,
  });

  HomeState copyWith({
    List<Service>? services,
  }) =>
      HomeState(
        services: services ?? this.services,
      );
}

class HomeDataInitialState extends HomeState {
  final HomeState state;
  HomeDataInitialState(
    this.state,
  ) : super(
          services: state.services,
        );
}
