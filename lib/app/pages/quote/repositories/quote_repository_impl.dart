import 'package:ekilibra_spa/app/config/helpers/helper_db.dart';
import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository.dart';

import '../model/quote.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  @override
  Future<bool> createQuote(Quote quote) async {
    return await HelperDb().createQuote(quote);
  }

  @override
  Future<List<Quote>> deleteQuote(String quoteId) async {
    return await HelperDb().deleteQuote(quoteId);
  }

  @override
  Future<List<Quote>> getQuotes() async {
    return HelperDb().getQuotes();
  }

  @override
  Future<bool> updateQuote(Quote quote) async {
    //TODO: pensar en validaciones
    return false;
  }
}
