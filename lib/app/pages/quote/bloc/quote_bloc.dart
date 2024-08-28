import 'package:ekilibra_spa/app/pages/quote/use_cases.dart/quote_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc(this.quoteUseCases)
      : super(QuoteListInitial(
          loading: true,
          [],
          [],
        )) {
    on<CreteQuote>(_createQuote);
    on<LoadQuotes>(_loadQuotes);
    on<LoadServices>(_loadServices);
  }

  final QuoteUseCases quoteUseCases;

  void _loadQuotes(LoadQuotes event, Emitter<QuoteState> emit) {}
  void _createQuote(CreteQuote event, Emitter<QuoteState> emit) {}
  Future _loadServices(LoadServices event, Emitter<QuoteState> emit) async {
    try {
      // emit(LoadingSaveProfile(state.data));

      final resp = await quoteUseCases.loadServicesUseCase.invoke();

      resp.fold(
        (l) => emit(ErrorLoadServicesState(
            'error guardando profile', state.quotes, state.services)),
        (r) =>
            emit(LoadServicesState(state.quotes, r)), //retornar data del perfil
      );
    } catch (e) {
      emit(ErrorLoadServicesState(e.toString(), state.quotes, state.services));
    }
  }
}
