part of 'home_bloc.dart';

@freezed
class HomeState {
  final List<Service>? services;
  final List<String>? places;

  HomeState({
    this.services,
    this.places,
  });

  HomeState copyWith({
    List<Service>? services,
    List<String>? places,
  }) =>
      HomeState(
        services: services ?? this.services,
        places: places ?? this.places,
      );
}

class HomeDataInitialState extends HomeState {
  final HomeState state;
  HomeDataInitialState(
    this.state,
  ) : super(
          services: state.services,
          places: state.places,
        );
}
