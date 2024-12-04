part of 'quote_bloc.dart';

abstract class QuoteEvent {}

class ResetBloc extends QuoteEvent {}

class CreteQuoteEvent extends QuoteEvent {
  final Quote quote;

  CreteQuoteEvent({
    required this.quote,
  });
}

class DeleteQuoteEvent extends QuoteEvent {
  final String quoteId;

  DeleteQuoteEvent(this.quoteId);
}
