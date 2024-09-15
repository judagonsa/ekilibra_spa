part of 'quote_bloc.dart';

class QuoteState {
  final Quote? quote;
  final bool loading;
  final List<String>? services;
  final List<String>? places;

  const QuoteState({
    this.quote,
    this.loading = false,
    this.services,
    this.places,
  });

  QuoteState copyWith({
    Quote? quote,
    bool? loading,
    List<String>? services,
    List<String>? places,
  }) =>
      QuoteState(
        quote: quote ?? this.quote,
        loading: loading ?? this.loading,
        services: services ?? this.services,
        places: places ?? this.places,
      );
}

class QuoteListInitialState extends QuoteState {
  final QuoteState state;
  QuoteListInitialState(this.state)
      : super(
          quote: state.quote,
          loading: state.loading,
          services: state.services,
          places: state.places,
        );
}

class QuoteListUpdateState extends QuoteState {
  final QuoteState state;
  final Quote quoteUpdate;
  QuoteListUpdateState(this.state, this.quoteUpdate)
      : super(
          quote: state.quote,
          loading: state.loading,
          services: state.services,
          places: state.places,
        );
}

class QuoteValidateFormState extends QuoteState {
  final QuoteState state;
  final String error;

  QuoteValidateFormState(this.state, this.error)
      : super(
          quote: state.quote,
          loading: state.loading,
          services: state.services,
          places: state.places,
        );
}

class ErrorLoadServicesState extends QuoteState {
  final QuoteState state;
  final String error;

  ErrorLoadServicesState(this.state, this.error)
      : super(
          quote: state.quote,
          loading: state.loading,
          services: state.services,
          places: state.places,
        );
}

class LoadServicesState extends QuoteState {
  final QuoteState state;

  LoadServicesState(this.state)
      : super(
          quote: state.quote,
          loading: state.loading,
          services: state.services,
          places: state.places,
        );
}

class CreateQuoteState extends QuoteState {
  final QuoteState state;
  final String error;

  CreateQuoteState(this.state, this.error)
      : super(
          quote: state.quote,
          loading: state.loading,
          services: state.services,
          places: state.places,
        );
}
