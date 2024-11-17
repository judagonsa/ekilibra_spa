import 'package:ekilibra_spa/app/config/helpers/texts.dart';
import 'package:ekilibra_spa/app/pages/pages.dart';
import 'package:ekilibra_spa/app/pages/quote/pages/quote_page.dart';
import 'package:ekilibra_spa/app/widgets/banners/banners.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const name = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Banners(images: [
          "https://picsum.photos/id/9/400/200",
          "https://picsum.photos/id/10/400/200",
          "https://picsum.photos/id/11/400/200",
          "https://picsum.photos/id/12/400/200"
        ]),
        ElevatedButton(
          onPressed: () {
            context.push(ProfilePage.name, extra: {'isRegister': false});
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.person),
              Text(Texts.profile),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.push(QuotePage.name);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.person),
              Text(Texts.scheduleQuote),
            ],
          ),
        )
      ],
    );
  }
}
