part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadServicesEvent extends HomeEvent {}

class ErrorLoadServicesState extends HomeState {
  final HomeState state;
  final String error;

  ErrorLoadServicesState(this.state, this.error)
      : super(
          services: state.services,
        );
}

class LoadServicesState extends HomeState {
  final HomeState state;

  LoadServicesState(this.state)
      : super(
          services: state.services,
        );
}
