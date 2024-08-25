import 'package:ekilibra_spa/app/pages/quote/bloc/quote_bloc.dart';

abstract class QuoteRepository {
  Future<bool> registerProfile(Quote quote);
  Future<bool> updateProfile(Quote quote);
  Future<bool> deleteProfile(String quoteId);
  Future<Quote?> getProfile(String quoteId);
}
