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
        images: [
          "https://picsum.photos/id/1/400/200",
          "https://picsum.photos/id/2/400/200",
          "https://picsum.photos/id/3/400/200",
          "https://picsum.photos/id/4/400/200"
        ],
        observation: 'Cuidados',
      ),
      const Service(
        title: "Camilla",
        resumen: 'resumen',
        duration: '15 min',
        images: [
          "https://picsum.photos/id/5/400/200",
          "https://picsum.photos/id/6/400/200",
          "https://picsum.photos/id/7/400/200",
          "https://picsum.photos/id/8/400/200"
        ],
        observation: 'Ninguno',
      ),
      const Service(
        title: "Masaje",
        resumen: 'resumen',
        duration: '60 - 90 min',
        images: [
          "https://picsum.photos/id/9/400/200",
          "https://picsum.photos/id/10/400/200",
          "https://picsum.photos/id/11/400/200",
          "https://picsum.photos/id/12/400/200"
        ],
        observation: 'Ropa o vestimenta',
      ),
    ];
  }

  @override
  Future<List<String>> getPlaces() async {
    return ['Sogamoso', 'Duitama', 'Tunja'];
  }
}
