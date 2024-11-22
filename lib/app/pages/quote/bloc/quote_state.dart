part of 'quote_bloc.dart';

class QuoteState {
  final Quote? quote;
  final bool loading;

  const QuoteState({
    this.quote,
    this.loading = false,
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
      );
}

class QuoteListInitialState extends QuoteState {
  final QuoteState state;
  QuoteListInitialState(this.state)
      : super(
          quote: state.quote,
          loading: state.loading,
        );
}

class QuoteListUpdateState extends QuoteState {
  final QuoteState state;
  final Quote quoteUpdate;
  QuoteListUpdateState(this.state, this.quoteUpdate)
      : super(
          quote: state.quote,
          loading: state.loading,
        );
}

class QuoteValidateFormState extends QuoteState {
  final QuoteState state;
  final String error;

  QuoteValidateFormState(this.state, this.error)
      : super(
          quote: state.quote,
          loading: state.loading,
        );
}

class ErrorLoadPlacesState extends QuoteState {
  final QuoteState state;
  final String error;

  ErrorLoadPlacesState(this.state, this.error)
      : super(
          quote: state.quote,
          loading: state.loading,
        );
}

class LoadPlacesState extends QuoteState {
  final QuoteState state;

  LoadPlacesState(this.state)
      : super(
          quote: state.quote,
          loading: state.loading,
        );
}

class CreateQuoteState extends QuoteState {
  final QuoteState state;

  CreateQuoteState(this.state)
      : super(
          quote: state.quote,
          loading: state.loading,
        );
}

class ErrorCreateQuoteState extends QuoteState {
  final QuoteState state;
  final String error;

  ErrorCreateQuoteState(this.state, this.error)
      : super(
          quote: state.quote,
          loading: state.loading,
        );
}
