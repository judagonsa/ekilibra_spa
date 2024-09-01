part of 'quote_bloc.dart';

abstract class QuoteEvent {}

class LoadQuotes extends QuoteEvent {}

class CreteQuote extends QuoteEvent {}

class DeleteQuote extends QuoteEvent {
  final String quoteId;

  DeleteQuote(this.quoteId);
}

class UpdateQuote extends QuoteEvent {
  final Quote quote;

  UpdateQuote(this.quote);
}

class LoadServices extends QuoteEvent {}
