import 'package:ekilibra_spa/app/pages/home/use_cases/load_places_use_case.dart';
import 'package:ekilibra_spa/app/pages/home/use_cases/load_services_use_case.dart';

class HomeUseCases {
  final LoadServicesUseCase loadServicesUseCase;
  final LoadPlacesUseCase loadPlacesUseCase;

  HomeUseCases({
    required this.loadServicesUseCase,
    required this.loadPlacesUseCase,
  });
}
