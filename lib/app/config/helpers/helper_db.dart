import 'dart:convert';

import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperDb {
  Future<List<Quote>> getQuotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? quotesString = prefs.getString('quotes');
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final quotesString = json.encode(quotes);
    try {
      await prefs.setString('quotes', quotesString);
      return true;
    } catch (e) {
      return false;
    }
  }
}
