import 'package:ekilibra_spa/app/pages/quote/use_cases.dart/create_quote_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases.dart/delete_quote_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases.dart/get_quotes_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases.dart/load_places_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases.dart/load_services_use_case.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases.dart/update_quote_use_case.dart';

class QuoteUseCases {
  final CreateQuoteUseCase createQuoteUseCase;
  final DeleteQuoteUseCase deleteQuoteUseCase;
  final GetQuotesUseCase getQuotesUseCase;
  final UpdateQuoteUseCase updateQuoteUseCase;
  final LoadServicesUseCase loadServicesUseCase;
  final LoadPlacesUseCase loadPlacesUseCase;

  QuoteUseCases({
    required this.createQuoteUseCase,
    required this.deleteQuoteUseCase,
    required this.getQuotesUseCase,
    required this.updateQuoteUseCase,
    required this.loadServicesUseCase,
    required this.loadPlacesUseCase,
  });
}
