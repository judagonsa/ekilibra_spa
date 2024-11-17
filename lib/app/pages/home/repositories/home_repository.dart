import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';

abstract class HomeRepository {
  Future<List<Service>> getServices();
}
