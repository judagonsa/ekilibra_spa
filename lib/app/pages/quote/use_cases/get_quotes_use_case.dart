import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository.dart';

import '../model/quote.dart';

class GetQuotesUseCase {
  final QuoteRepository _quoteRepository;

  GetQuotesUseCase(this._quoteRepository);

  Future<Either<bool, List<Quote>?>> invoke() async {
    try {
      final success = await _quoteRepository.getQuotes();
      return success.isNotEmpty ? Right(success) : const Left(false);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
