import 'dart:convert';

import 'package:ekilibra_spa/app/config/exports/helpers/exports_helpers.dart';
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';

class HelperDb {
  Future<List<Quote>> getQuotes() async {
    final String? quotesString =
        await SharedPreferencesHelper().getValue('quotes');
    if (quotesString != null) {
      final data = json.decode(quotesString);
      final list = (data as List).map((quote) => Quote.fromJson(quote));
      return list.toList();
    }
    return [];
  }

  Future<bool> createQuote(Quote quote) async {
    final List<Quote> myQuotes = await getQuotes();
    myQuotes.add(quote);
    return await saveQuotes(myQuotes);
  }

  Future<List<Quote>> deleteQuote(String quoteId) async {
    final listQuote = await HelperDb().getQuotes();

    final index =
        listQuote.indexWhere((quote) => quote.service?.title == quoteId);

    listQuote[index] = listQuote[index].copyWith(isEnable: false);

    if (await saveQuotes(listQuote)) {
      return listQuote;
    }
    return [];
  }

  Future<bool> saveQuotes(List<Quote> quotes) async {
    final quotesString = json.encode(quotes);
    try {
      await SharedPreferencesHelper().saveKey('quotes', quotesString);
      return true;
    } catch (e) {
      return false;
    }
  }
}
