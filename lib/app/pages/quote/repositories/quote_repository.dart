import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';

abstract class QuoteRepository {
  Future<bool> createQuote(Quote quote);
  Future<bool> updateQuote(Quote quote);
  Future<bool> deleteQuote(String quoteId);
  Future<List<Quote>> getQuotes();
  Future<List<Service>> getServices();
  Future<List<String>> getPlaces();
}
