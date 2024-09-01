import 'package:ekilibra_spa/app/pages/quote/use_cases.dart/quote_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc(this.quoteUseCases)
      : super(QuoteListInitial(
          Quote(),
          [],
        )) {
    on<CreteQuote>(_createQuote);
    on<LoadQuotes>(_loadQuotes);
    on<LoadServices>(_loadServices);
  }

  final QuoteUseCases quoteUseCases;

  void _loadQuotes(LoadQuotes event, Emitter<QuoteState> emit) {}
  void _createQuote(CreteQuote event, Emitter<QuoteState> emit) {
    if (state.quote.place == null) {
      emit(QuoteValidateForm(state.quote, state.services,
          error: 'Favor escoger un lugar'));
    } else if (state.quote.serviceId == null) {
      emit(QuoteValidateForm(state.quote, state.services,
          error: 'Favor escoger un servicio'));
    } else if (state.quote.day == null) {
      emit(QuoteValidateForm(state.quote, state.services,
          error: 'Favor escoger el día del servicio'));
    } else if (state.quote.hour == null) {
      emit(QuoteValidateForm(state.quote, state.services,
          error: 'Favor escoger la hora del servicio'));
    } else {
      emit(QuoteValidateForm(state.quote, state.services, error: ''));
    }
  }

  Future _loadServices(LoadServices event, Emitter<QuoteState> emit) async {
    try {
      // emit(LoadingSaveProfile(state.data));

      final resp = await quoteUseCases.loadServicesUseCase.invoke();

      resp.fold(
        (l) => emit(ErrorLoadServicesState(
            'error cargando servicios', state.quote, state.services)),
        (r) =>
            emit(LoadServicesState(state.quote, r)), //retornar data del perfil
      );
    } catch (e) {
      emit(ErrorLoadServicesState(e.toString(), state.quote, state.services));
    }
  }
}
