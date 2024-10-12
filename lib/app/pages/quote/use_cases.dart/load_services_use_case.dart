import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository.dart';

class LoadServicesUseCase {
  final QuoteRepository _quoteRepository;

  LoadServicesUseCase(this._quoteRepository);

  Future<Either<bool, List<Service>>> invoke() async {
    try {
      final listServices = await _quoteRepository.getServices();
      return listServices.isNotEmpty ? Right(listServices) : const Left(false);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
