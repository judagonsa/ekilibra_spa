import 'package:go_router/go_router.dart';

import '../exports/pages/exports_pages.dart';

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
          serviceId: args['serviceId'] as String,
        );
      },
    ),
    GoRoute(
      path: DetailQuote.name,
      builder: (context, state) {
        Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        return DetailQuote(
          serviceId: args['serviceId'] as String,
        );
      },
    ),
    GoRoute(
      path: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: MyQuotes.name,
      builder: (context, state) => const MyQuotes(),
    )
  ],
);
