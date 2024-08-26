import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/config/exports/blocs/exports_blocs_cubits.dart';
import 'package:ekilibra_spa/app/pages/quote/repositories/quote%20_repository.dart';

class CreateQuoteUseCase {
  final QuoteRepository _quoteRepository;

  CreateQuoteUseCase(this._quoteRepository);

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
