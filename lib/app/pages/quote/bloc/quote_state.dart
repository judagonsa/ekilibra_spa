part of 'quote_bloc.dart';

class QuoteState extends Equatable {
  final Quote? quote;
  final bool loading;

  final List<Quote>? quotes;

  const QuoteState({
    this.quote,
    this.loading = false,
    this.quotes,
  });

  QuoteState copyWith({
    Quote? quote,
    bool? loading,
    List<Quote>? quotes,
  }) =>
      QuoteState(
          quote: quote ?? this.quote,
          loading: loading ?? this.loading,
          quotes: quotes ?? this.quotes);

  @override
  List<Object?> get props => [quote, loading];
}

class QuoteListInitialState extends QuoteState {
  final QuoteState state;
  const QuoteListInitialState(this.state) : super();
}

class QuoteListUpdateState extends QuoteState {
  final List<Quote> newQuotes;
  const QuoteListUpdateState(this.newQuotes) : super(quotes: newQuotes);
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

class GetQuotesState extends QuoteState {
  final QuoteState state;
  const GetQuotesState(this.state) : super();
}

class UpdateQuotesState extends QuoteState {
  final QuoteState state;
  const UpdateQuotesState(this.state) : super();
}

class DeleteQuoteState extends QuoteState {
  final QuoteState state;
  DeleteQuoteState(this.state) : super(quotes: state.quotes);
}
