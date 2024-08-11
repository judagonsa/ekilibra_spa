import 'package:ekilibra_spa/app/pages/pages.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Welcome(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const Welcome(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(
        isRegister: false,
      ),
    )
  ],
);
