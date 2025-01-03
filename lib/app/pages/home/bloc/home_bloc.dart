import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:ekilibra_spa/app/pages/home/use_cases/home_use_cases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeUseCases) : super(HomeState(services: [], places: [])) {
    on<LoadServicesEvent>(_loadServices);
    on<LoadPlacesEvent>(_loadPlaces);
  }
  final HomeUseCases homeUseCases;

  Future _loadServices(LoadServicesEvent event, Emitter<HomeState> emit) async {
    try {
      // emit(LoadingSaveProfile(state.data));

      final resp = await homeUseCases.loadServicesUseCase.invoke();

      resp.fold(
        (l) => emit(ErrorLoadServicesState(state, 'Error cargando servicios')),
        (services) =>
            emit(LoadServicesState(state.copyWith(services: services))),
      );
    } catch (e) {
      emit(ErrorLoadServicesState(state, e.toString()));
    }
  }

  Future _loadPlaces(LoadPlacesEvent event, Emitter<HomeState> emit) async {
    try {
      // emit(LoadingSaveProfile(state.data));

      final resp = await homeUseCases.loadPlacesUseCase.invoke();

      resp.fold(
        (l) => emit(ErrorLoadPlacesState(state, 'Error cargando lugares')),
        (places) {
          emit(LoadPlacesState(state.copyWith(places: places)));
        },
      );
      add(LoadServicesEvent());
    } catch (e) {
      emit(ErrorLoadPlacesState(state, e.toString()));
    }
  }

  Service? getServiceFromId(String serviceId) {
    final exist =
        state.services?.any((service) => service.title == serviceId) ?? false;
    if (!exist) return null;

    return state.services?.firstWhere((service) => service.title! == serviceId);
  }
}
