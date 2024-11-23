import 'package:ekilibra_spa/app/pages/DetailQuote/pages/detail_quote.dart';
import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:ekilibra_spa/app/pages/pages.dart';
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:ekilibra_spa/app/pages/quote/pages/quote_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: WelcomePage.name,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: LoginPage.name,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: ProfilePage.name,
      builder: (context, state) {
        Map<String, bool> args = state.extra as Map<String, bool>;
        return ProfilePage(isRegister: args['isRegister']!);
      },
    ),
    GoRoute(
      path: QuotePage.name,
      builder: (context, state) {
        Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        return QuotePage(
          places: args['places'] as List<String>,
          services: args['services'] as List<Service>,
        );
      },
    ),
    GoRoute(
      path: DetailQuote.name,
      builder: (context, state) {
        Map<String, Quote> args = state.extra as Map<String, Quote>;
        return DetailQuote(quote: args['quote']!);
      },
    ),
    GoRoute(
      path: HomePage.name,
      builder: (context, state) => const HomePage(),
    )
  ],
);
