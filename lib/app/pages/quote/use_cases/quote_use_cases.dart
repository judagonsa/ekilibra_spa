import 'package:ekilibra_spa/app/pages/quote/use_cases/create_quote_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases/delete_quote_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases/get_quotes_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases/update_quote_use_case.dart';

class QuoteUseCases {
  final CreateQuoteUseCase createQuoteUseCase;
  final DeleteQuoteUseCase deleteQuoteUseCase;
  final GetQuotesUseCase getQuotesUseCase;
  final UpdateQuoteUseCase updateQuoteUseCase;

  QuoteUseCases({
    required this.createQuoteUseCase,
    required this.deleteQuoteUseCase,
    required this.getQuotesUseCase,
    required this.updateQuoteUseCase,
  });
}
