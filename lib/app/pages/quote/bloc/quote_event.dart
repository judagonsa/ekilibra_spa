part of 'quote_bloc.dart';

abstract class QuoteEvent {}

class LoadQuotes extends QuoteEvent {}

class CreteQuote extends QuoteEvent {}

class DeleteQuote extends QuoteEvent {
  final String quoteId;

  DeleteQuote(this.quoteId);
}

class LoadServices extends QuoteEvent {}

class ReloadQuote extends QuoteEvent {}

class UpdateHourQuote extends QuoteEvent {
  final String hour;

  UpdateHourQuote(this.hour);
}

class UpdatePlaceQuote extends QuoteEvent {
  final String place;

  UpdatePlaceQuote(this.place);
}

class UpdateServiceQuote extends QuoteEvent {
  final String service;

  UpdateServiceQuote(this.service);
}

class UpdateDayQuote extends QuoteEvent {
  final String day;

  UpdateDayQuote(this.day);
}
