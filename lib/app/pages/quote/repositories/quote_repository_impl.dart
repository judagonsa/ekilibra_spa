import 'package:ekilibra_spa/app/config/helpers/helper_db.dart';
import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository.dart';

import '../model/quote.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  @override
  Future<bool> createQuote(Quote quote) async {
    //solo es para manera local
    var listQuote = await HelperDb().getQuotes();
    //TODO: validar citas a la misma hora ?
    listQuote.add(quote);
    return await HelperDb().createQuote(listQuote);
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
