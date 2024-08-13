import 'package:ekilibra_spa/app/pages/pages.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) {
        Map<String, bool> args = state.extra as Map<String, bool>;
        return ProfilePage(isRegister: args['isRegister']!);
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    )
  ],
);
