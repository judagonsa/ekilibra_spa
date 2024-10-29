import 'package:ekilibra_spa/app/config/helpers/texts.dart';
import 'package:ekilibra_spa/app/pages/pages.dart';
import 'package:ekilibra_spa/app/pages/quote/pages/quote_page.dart';
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
    return Row(
      children: [
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
