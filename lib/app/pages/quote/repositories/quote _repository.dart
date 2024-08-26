import 'package:ekilibra_spa/app/pages/quote/bloc/quote_bloc.dart';

abstract class QuoteRepository {
  Future<bool> createQuote(Quote quote);
  Future<bool> updateQuote(Quote quote);
  Future<bool> deleteQuote(String quoteId);
  Future<List<Quote>> getQuotes();
}
