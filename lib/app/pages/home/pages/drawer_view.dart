import 'package:ekilibra_spa/app/config/exports/pages/exports_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.white),
            accountName: Text("Guillermo García"),
            accountEmail: Text("email@prueba.es"),
            //TODO: cargar datos y visualizar
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              context.push(ProfilePage.name, extra: {'isRegister': false});
              Scaffold.of(context).closeDrawer();
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Mis citas'),
            onTap: () {
              context.push(MyQuotes.name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Nosotros'),
            onTap: () {
              //TODO: implementar la navegación a la página de nosotros
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Nuestros lugares'),
            onTap: () {
              //TODO: implementar la navegación a la página nuestros lugares
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Políticas de privacidad'),
            onTap: () {
              //TODO: implementar la navegación a la página de políticas de privacidad
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark_outlined),
            title: const Text('Preguntas y respuestas'),
            onTap: () {
              //TODO: implementar la navegación a la página de preguntas y respuestas
            },
          ),
          ListTile(
            leading: const Icon(Icons.recommend_rounded),
            title: const Text('Recomendaciones quejas y reclamos'),
            onTap: () {
              //TODO: implementar la navegación a la página de recomendaciones quejas y reclamos
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone_rounded),
            title: const Text('Contactanos'),
            onTap: () {
              //TODO: implementar la navegación a la página de contactanos
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar sesión'),
            onTap: () {
              //TODO: cerrar sesión y eliminar datos del teléfono
              context.go(LoginPage.name);
            },
          ),
          const Spacer(),
          const Center(
            child: Text(
              'Versión 1.0.0',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          const Center(
            child: Text(
              'JG',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
