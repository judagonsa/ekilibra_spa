part of 'quote_bloc.dart';

class QuoteState {
  final Quote? quote;
  final bool loading;
  final List<Service>? services;
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
    List<Service>? services,
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

class ErrorLoadPlacesState extends QuoteState {
  final QuoteState state;
  final String error;

  ErrorLoadPlacesState(this.state, this.error)
      : super(
          quote: state.quote,
          loading: state.loading,
          services: state.services,
          places: state.places,
        );
}

class LoadPlacesState extends QuoteState {
  final QuoteState state;

  LoadPlacesState(this.state)
      : super(
          quote: state.quote,
          loading: state.loading,
          services: state.services,
          places: state.places,
        );
}

class CreateQuoteState extends QuoteState {
  final QuoteState state;

  CreateQuoteState(this.state)
      : super(
          quote: state.quote,
          loading: state.loading,
          services: state.services,
          places: state.places,
        );
}

class ErrorCreateQuoteState extends QuoteState {
  final QuoteState state;
  final String error;

  ErrorCreateQuoteState(this.state, this.error)
      : super(
          quote: state.quote,
          loading: state.loading,
          services: state.services,
          places: state.places,
        );
}
