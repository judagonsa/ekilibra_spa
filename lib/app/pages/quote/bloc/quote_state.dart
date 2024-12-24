part of 'quote_bloc.dart';

class QuoteState {
  final Data data;

  QuoteState(this.data);
}

class Data {
  final Quote? quote;
  final bool loading;
  final List<Quote>? quotes;

  Data({
    this.quote,
    this.loading = false,
    this.quotes,
  });

  Data copyWith({
    Quote? quote,
    bool? loading,
    List<Quote>? quotes,
  }) =>
      Data(
        quote: quote ?? this.quote,
        loading: loading ?? this.loading,
        quotes: quotes ?? this.quotes,
      );
}

class QuoteStateInitState extends QuoteState {
  QuoteStateInitState()
      : super(
          Data(
            loading: false,
            quotes: [],
          ),
        );
}

class QuoteListInitialState extends QuoteState {
  QuoteListInitialState(super.data);
}

class QuoteListUpdateState extends QuoteState {
  QuoteListUpdateState(super.data);
}

class QuoteValidateFormState extends QuoteState {
  final String error;

  QuoteValidateFormState(super.data, this.error);
}

class ErrorLoadPlacesState extends QuoteState {
  final String error;

  ErrorLoadPlacesState(super.data, this.error);
}

class LoadPlacesState extends QuoteState {
  LoadPlacesState(super.data);
}

class CreateQuoteState extends QuoteState {
  CreateQuoteState(super.data);
}

class ErrorCreateQuoteState extends QuoteState {
  final String error;

  ErrorCreateQuoteState(super.data, this.error);
}

class GetQuotesState extends QuoteState {
  GetQuotesState(super.data);
}

class UpdateQuotesState extends QuoteState {
  UpdateQuotesState(super.data);
}

class DeleteQuoteState extends QuoteState {
  DeleteQuoteState(super.data);
}
