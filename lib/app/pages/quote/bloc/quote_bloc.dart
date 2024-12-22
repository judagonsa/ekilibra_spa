import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases/quote_use_cases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc(this.quoteUseCases) : super(const QuoteState()) {
    on<CreteQuoteEvent>(_createQuote);
    on<ResetBloc>(_reset);
    on<DeleteQuoteEvent>(_deleteQuote);
    on<GetQuoteEvent>(_getQuotes);
  }

  final QuoteUseCases quoteUseCases;

  void _reset(ResetBloc event, Emitter<QuoteState> emit) {
    emit(const QuoteState());
  }

  void _createQuote(CreteQuoteEvent event, Emitter<QuoteState> emit) async {
    final resp = await quoteUseCases.createQuoteUseCase.invoke(event.quote);

    resp.fold(
      (l) => emit(ErrorCreateQuoteState(state, 'Error creando agendamiento')),
      (success) {
        if (success) {
          emit(CreateQuoteState(state.copyWith(quote: event.quote)));
        } else {
          emit(ErrorCreateQuoteState(state, 'Error creando agendamiento'));
        }
      },
    );
  }

  void _deleteQuote(DeleteQuoteEvent event, Emitter<QuoteState> emit) async {
    final resp = await quoteUseCases.deleteQuoteUseCase.invoke(event.quoteId);

    resp.fold(
      (l) => emit(ErrorCreateQuoteState(state, 'Error creando agendamiento')),
      (success) {
        if (success.isNotEmpty) {
          emit(DeleteQuoteState(state.copyWith(quotes: success)));
        } else {
          emit(ErrorCreateQuoteState(state, 'No hay agendamientos'));
        }
      },
    );
  }

  void _getQuotes(GetQuoteEvent event, Emitter<QuoteState> emit) async {
    final resp = await quoteUseCases.getQuotesUseCase.invoke();

    resp.fold(
      (l) => emit(ErrorCreateQuoteState(state, 'Error creando agendamiento')),
      (success) {
        if (success?.isNotEmpty ?? false) {
          emit(GetQuotesState(state.copyWith(quotes: success)));
        } else {
          emit(ErrorCreateQuoteState(state, 'No hay agendamientos'));
        }
      },
    );
  }
}
