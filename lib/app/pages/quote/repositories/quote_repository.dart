import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';

abstract class QuoteRepository {
  Future<bool> createQuote(Quote quote);
  Future<bool> updateQuote(Quote quote);
  Future<List<Quote>> deleteQuote(String quoteId);
  Future<List<Quote>> getQuotes();
}
