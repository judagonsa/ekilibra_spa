part of 'quote_bloc.dart';

abstract class QuoteState {
  Quote quote;
  List<String> services;

  QuoteState(this.quote, this.services);
}

class QuoteListInitial extends QuoteState {
  QuoteListInitial(super.quotes, super.services);
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

class QuoteValidateForm extends QuoteState {
  final String error;

  QuoteValidateForm(super.quotes, super.services, {required this.error});
}

class Quote {
  String? quoteId;
  String? place;
  String? serviceId;
  DateTime? day;
  TimeOfDay? hour;
  String? observations;

  Quote({
    this.quoteId,
    this.place,
    this.serviceId,
    this.day,
    this.hour,
    this.observations,
  });
}
