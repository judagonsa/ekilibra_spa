import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:ekilibra_spa/app/pages/quote/repositories/quote_repository.dart';

import '../model/quote.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  @override
  Future<bool> createQuote(Quote quote) async {
    return true;
  }

  @override
  Future<bool> deleteQuote(String quoteId) async {
    return false;
  }

  @override
  Future<List<Quote>> getQuotes() async {
    return [];
  }

  @override
  Future<bool> updateQuote(Quote quote) async {
    return false;
  }

  @override
  Future<List<Service>> getServices() async {
    return [
      const Service(
        title: "Limpieza facial",
        resumen: 'resumen',
        duration: '50 min',
        images: [],
        observation: 'Cuidados',
      ),
      const Service(
        title: "Camilla",
        resumen: 'resumen',
        duration: '15 min',
        images: [],
        observation: 'Ninguno',
      ),
      const Service(
        title: "Masaje",
        resumen: 'resumen',
        duration: '60 - 90 min',
        images: [],
        observation: 'Ropa o vestimenta',
      ),
    ];
  }

  @override
  Future<List<String>> getPlaces() async {
    return ['Sogamoso', 'Duitama', 'Tunja'];
  }
}
