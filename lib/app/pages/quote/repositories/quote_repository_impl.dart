import 'package:ekilibra_spa/app/pages/quote/bloc/quote_bloc.dart';
import 'package:ekilibra_spa/app/pages/quote/repositories/quote%20_repository.dart';

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
}
