import 'package:ekilibra_spa/app/pages/quote/use_cases.dart/quote_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc(this.quoteUseCases) : super(QuoteListInitial(true, [])) {
    on<CreteQuote>(_createQuote);
    on<LoadQuotes>(_loadQuotes);
  }

  final QuoteUseCases quoteUseCases;

  void _loadQuotes(LoadQuotes event, Emitter<QuoteState> emit) {}
  void _createQuote(CreteQuote event, Emitter<QuoteState> emit) {}
}
