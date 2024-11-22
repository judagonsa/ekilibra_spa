import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/home/repositories/home_repository.dart';

class LoadPlacesUseCase {
  final HomeRepository _homeRepository;

  LoadPlacesUseCase(this._homeRepository);

  Future<Either<bool, List<String>>> invoke() async {
    try {
      final listServices = await _homeRepository.getPlaces();
      return listServices.isNotEmpty ? Right(listServices) : const Left(false);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
