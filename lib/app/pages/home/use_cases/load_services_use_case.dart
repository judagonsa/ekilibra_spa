import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:ekilibra_spa/app/pages/home/repositories/home_repository.dart';

class LoadServicesUseCase {
  final HomeRepository _homeRepository;

  LoadServicesUseCase(this._homeRepository);

  Future<Either<bool, List<Service>>> invoke() async {
    try {
      final listServices = await _homeRepository.getServices();
      return listServices.isNotEmpty ? Right(listServices) : const Left(false);
    } catch (e) {
      return const Left(false);
    }
  }
}
