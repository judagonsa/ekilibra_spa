part of 'quote_bloc.dart';

abstract class QuoteState {
  List<Quote> quotes;

  QuoteState(this.quotes);
}

class QuoteListInitial extends QuoteState {
  final bool loading;
  QuoteListInitial(this.loading, super.quotes);
}

class QuoteListUpdate extends QuoteState {
  QuoteListUpdate(super.quotes);
}

class Quote {
  final String quoteId;
  final String place;
  final String serviceId;
  final DateTime day;
  final TimeOfDay hour;
  final String? observations;

  Quote({
    required this.quoteId,
    required this.place,
    required this.serviceId,
    required this.day,
    required this.hour,
    this.observations,
  });
}
