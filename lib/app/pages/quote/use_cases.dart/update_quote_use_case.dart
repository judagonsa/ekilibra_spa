import 'package:dartz/dartz.dart';

import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository.dart';

import '../model/quote.dart';

class UpdateQuoteUseCase {
  final QuoteRepository _quoteRepository;

  UpdateQuoteUseCase(this._quoteRepository);

  Future<Either<bool, bool>> invoke(Quote quote) async {
    try {
      final success = await _quoteRepository.createQuote(quote);
      return success ? Right(success) : Left(success);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
