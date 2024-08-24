import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteListInitial(true, [])) {
    on<CreteQuote>(_createQuote);
    on<LoadQuotes>(_loadQuotes);
  }

  void _loadQuotes(LoadQuotes event, Emitter<QuoteState> emit) {}
  void _createQuote(CreteQuote event, Emitter<QuoteState> emit) {}
}
