import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository.dart';

class LoadPlacesUseCase {
  final QuoteRepository _quoteRepository;

  LoadPlacesUseCase(this._quoteRepository);

  Future<Either<bool, List<String>>> invoke() async {
    try {
      final listServices = await _quoteRepository.getPlaces();
      return listServices.isNotEmpty ? Right(listServices) : const Left(false);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
