part of 'quote_bloc.dart';

abstract class QuoteState {
  List<Quote> quotes;
  List<String> services;

  QuoteState(this.quotes, this.services);
}

class QuoteListInitial extends QuoteState {
  final bool loading;

  QuoteListInitial(super.quotes, super.services, {required this.loading});
}

class QuoteListUpdate extends QuoteState {
  QuoteListUpdate(super.quotes, super.services);
}

class LoadServicesState extends QuoteState {
  LoadServicesState(super.quotes, super.services);
}

class ErrorLoadServicesState extends QuoteState {
  final String error;

  ErrorLoadServicesState(this.error, super.quotes, super.services);
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
