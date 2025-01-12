import 'package:ekilibra_spa/app/config/exports/pages/exports_pages.dart';
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
    ),
    GoRoute(
      path: ShowInformationPage.name,
      builder: (context, state) {
        Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        final title = args['title'] as String;
        final subTitle = args['subTitle'] as String?;
        final description = args['description'] as String;
        final phrase = args['phrase'] as String?;
        return ShowInformationPage(
          title: title,
          subTitle: subTitle,
          description: description,
          phrase: phrase,
        );
      },
    ),
    GoRoute(
      path: QuestionsAnswers.name,
      builder: (context, state) => const QuestionsAnswers(),
    ),
  ],
);
