import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases.dart/quote_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc(this.quoteUseCases) : super(const QuoteState()) {
    on<LoadServicesEvent>(_loadServices);
    on<LoadPlacesEvent>(_loadPlaces);
    on<CreteQuoteEvent>(_createQuote);
  }

  final QuoteUseCases quoteUseCases;

  void _createQuote(CreteQuoteEvent event, Emitter<QuoteState> emit) async {
    final resp = await quoteUseCases.createQuoteUseCase.invoke(event.quote);

    resp.fold(
      (l) => emit(ErrorCreateQuoteState(state, 'Error creando agendamiento')),
      (success) {
        if (success) emit(CreateQuoteState(state.copyWith(quote: event.quote)));
        // emit(ErrorCreateQuoteState(state, 'Error creando agendamiento'));
      },
    );
  }

  Future _loadPlaces(LoadPlacesEvent event, Emitter<QuoteState> emit) async {
    try {
      // emit(LoadingSaveProfile(state.data));

      final resp = await quoteUseCases.loadPlacesUseCase.invoke();

      resp.fold(
        (l) => emit(ErrorLoadServicesState(state, 'Error cargando lugares')),
        (places) {
          emit(LoadPlacesState(state.copyWith(places: places)));
        },
      );
      add(LoadServicesEvent());
    } catch (e) {
      emit(ErrorLoadServicesState(state, e.toString()));
    }
  }

  Future _loadServices(
      LoadServicesEvent event, Emitter<QuoteState> emit) async {
    try {
      // emit(LoadingSaveProfile(state.data));

      final resp = await quoteUseCases.loadServicesUseCase.invoke();

      resp.fold(
        (l) => emit(ErrorLoadServicesState(state, 'Error cargando servicios')),
        (services) =>
            emit(LoadServicesState(state.copyWith(services: services))),
      );
    } catch (e) {
      emit(ErrorLoadServicesState(state, e.toString()));
    }
  }
}
