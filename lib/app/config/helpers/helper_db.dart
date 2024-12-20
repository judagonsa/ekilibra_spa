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

  Future<bool> createQuote(List<Quote> quotes) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final quotesString = json.encode(quotes);
    await prefs.setString('quotes', quotesString);
    return true;
  }
}
