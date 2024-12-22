part of 'quote_bloc.dart';

abstract class QuoteEvent {}

class ResetBloc extends QuoteEvent {}

class CreteQuoteEvent extends QuoteEvent {
  final Quote quote;

  CreteQuoteEvent({
    required this.quote,
  });
}

class UpdateQuoteEvent extends QuoteEvent {
  final String quoteId;

  UpdateQuoteEvent(this.quoteId);
}

class GetQuoteEvent extends QuoteEvent {
  GetQuoteEvent();
}

class DeleteQuoteEvent extends QuoteEvent {
  final String quoteId;

  DeleteQuoteEvent(this.quoteId);
}
