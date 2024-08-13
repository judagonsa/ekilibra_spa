import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
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
    return ElevatedButton(
      onPressed: () {
        context.push('/profile', extra: {'isRegister': false});
      },
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person),
          Text('Perfil'),
        ],
      ),
    );
  }
}
