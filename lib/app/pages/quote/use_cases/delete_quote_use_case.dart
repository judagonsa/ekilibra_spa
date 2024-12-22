import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository.dart';

class DeleteQuoteUseCase {
  final QuoteRepository _quoteRepository;

  DeleteQuoteUseCase(this._quoteRepository);

  Future<Either<bool, List<Quote>>> invoke(String quoteId) async {
    try {
      final success = await _quoteRepository.deleteQuote(quoteId);
      return success.isNotEmpty ? Right(success) : const Left(false);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
