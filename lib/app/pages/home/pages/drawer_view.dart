import 'package:ekilibra_spa/app/config/exports/pages/exports_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Text(
              'Ekilibra Spa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Perfil'),
            onTap: () {
              context.push(ProfilePage.name, extra: {'isRegister': false});
            },
          ),
          ListTile(
            title: const Text('Mis citas'),
            onTap: () {
              context.push(MyQuotes.name);
            },
          ),
          ListTile(
            title: const Text('Nosotros'),
            onTap: () {
              //todo: implementar la navegación a la página de nosotros
            },
          ),
          ListTile(
            title: const Text('Cerrar sesión'),
            onTap: () {
              context.go(LoginPage.name);
            },
          ),
        ],
      ),
    );
  }
}
