part of 'quote_bloc.dart';

abstract class QuoteEvent {}

class LoadQuotes extends QuoteEvent {}

class CreteQuote extends QuoteEvent {
  final Quote quote;

  CreteQuote(this.quote);
}

class DeleteQuote extends QuoteEvent {
  final Quote quote;

  DeleteQuote(this.quote);
}

class UpdateQuote extends QuoteEvent {
  final Quote quote;

  UpdateQuote(this.quote);
}

class LoadServices extends QuoteEvent {}
