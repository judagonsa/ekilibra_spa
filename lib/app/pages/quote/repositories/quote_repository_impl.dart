import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository.dart';

import '../model/quote.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  @override
  Future<bool> createQuote(Quote quote) async {
    return false;
  }

  @override
  Future<bool> deleteQuote(String quoteId) async {
    return false;
  }

  @override
  Future<List<Quote>> getQuotes() async {
    return [];
  }

  @override
  Future<bool> updateQuote(Quote quote) async {
    return false;
  }

  @override
  Future<List<String>> getServices() async {
    return ['Limpieza facial', 'Masaje', 'Camilla'];
  }

  @override
  Future<List<String>> getPlaces() async {
    return ['Sogamoso', 'Duitama', 'Tunja'];
  }
}
