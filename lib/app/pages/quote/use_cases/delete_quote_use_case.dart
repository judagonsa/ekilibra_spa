import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository.dart';

class DeleteQuoteUseCase {
  final QuoteRepository _quoteRepository;

  DeleteQuoteUseCase(this._quoteRepository);

  Future<Either<bool, bool>> invoke(String quoteId) async {
    try {
      final success = await _quoteRepository.deleteQuote(quoteId);
      return success ? Right(success) : Left(success);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
