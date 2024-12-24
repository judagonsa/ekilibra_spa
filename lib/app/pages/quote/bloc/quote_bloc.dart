import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases/quote_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc(this.quoteUseCases) : super(QuoteStateInitState()) {
    on<CreteQuoteEvent>(_createQuote);
    on<ResetBloc>(_reset);
    on<DeleteQuoteEvent>(_deleteQuote);
    on<GetQuoteEvent>(_getQuotes);
  }

  final QuoteUseCases quoteUseCases;

  void _reset(ResetBloc event, Emitter<QuoteState> emit) {
    //emit(const QuoteState());
  }

  void _createQuote(CreteQuoteEvent event, Emitter<QuoteState> emit) async {
    final resp = await quoteUseCases.createQuoteUseCase.invoke(event.quote);

    resp.fold(
      (l) =>
          emit(ErrorCreateQuoteState(state.data, 'Error creando agendamiento')),
      (success) {
        if (success) {
          emit(CreateQuoteState(state.data.copyWith(quote: event.quote)));
        } else {
          emit(ErrorCreateQuoteState(state.data, 'Error creando agendamiento'));
        }
      },
    );
  }

  void _deleteQuote(DeleteQuoteEvent event, Emitter<QuoteState> emit) async {
    final resp = await quoteUseCases.deleteQuoteUseCase.invoke(event.quoteId);

    resp.fold(
      (l) =>
          emit(ErrorCreateQuoteState(state.data, 'Error creando agendamiento')),
      (quotes) {
        if (quotes.isNotEmpty) {
          emit(DeleteQuoteState(state.data.copyWith(quotes: quotes)));
        } else {
          emit(ErrorCreateQuoteState(state.data, 'No hay agendamientos'));
        }
      },
    );
  }

  void _getQuotes(GetQuoteEvent event, Emitter<QuoteState> emit) async {
    final resp = await quoteUseCases.getQuotesUseCase.invoke();

    resp.fold(
      (l) =>
          emit(ErrorCreateQuoteState(state.data, 'Error creando agendamiento')),
      (quotes) {
        if (quotes?.isNotEmpty ?? false) {
          emit(GetQuotesState(state.data.copyWith(quotes: quotes)));
        } else {
          emit(ErrorCreateQuoteState(state.data, 'No hay agendamientos'));
        }
      },
    );
  }
}
