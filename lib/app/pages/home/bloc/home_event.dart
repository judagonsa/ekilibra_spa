part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadServicesEvent extends HomeEvent {}

class ErrorLoadServicesState extends HomeState {
  final HomeState state;
  final String error;

  ErrorLoadServicesState(this.state, this.error)
      : super(
          services: state.services,
          places: state.places,
        );
}

class LoadServicesState extends HomeState {
  final HomeState state;

  LoadServicesState(this.state)
      : super(
          services: state.services,
          places: state.places,
        );
}

class LoadPlacesEvent extends HomeEvent {}

class ErrorLoadPlacesState extends HomeState {
  final HomeState state;
  final String error;

  ErrorLoadPlacesState(this.state, this.error)
      : super(
          services: state.services,
          places: state.places,
        );
}

class LoadPlacesState extends HomeState {
  final HomeState state;

  LoadPlacesState(this.state)
      : super(
          services: state.services,
          places: state.places,
        );
}
