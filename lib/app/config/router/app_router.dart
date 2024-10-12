import 'package:ekilibra_spa/app/pages/DetailQuote/pages/detail_quote.dart';
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
      path: '/welcome',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) {
        Map<String, bool> args = state.extra as Map<String, bool>;
        return ProfilePage(isRegister: args['isRegister']!);
      },
    ),
    GoRoute(
      path: '/quote',
      builder: (context, state) => const QuotePage(),
    ),
    GoRoute(
      path: '/detail_quote',
      builder: (context, state) {
        Map<String, Quote> args = state.extra as Map<String, Quote>;
        return DetailQuote(quote: args['quote']!);
      },
    )
  ],
);
