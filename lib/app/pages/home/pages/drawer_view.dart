import 'package:ekilibra_spa/app/config/exports/pages/exports_pages.dart';
import 'package:ekilibra_spa/app/pages/sowInformationPage/show_information_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            currentAccountPicture:
                const CircleAvatar(backgroundColor: Colors.white),
            accountName: const Text("Guillermo García"),
            accountEmail: const Text("email@prueba.es"),
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
              context.push(ShowInformationPage.name, extra: {
                'title': 'Nosotros',
                'description':
                    '''Ekilibra es tu refugio de bienestar y belleza, donde la armonía del cuerpo y la mente se fusionan en una experiencia rejuvenecedora.
                    Nuestro equipo de profesionales altamente capacitados en fisioterapia, estética y cosmetología está dedicado a ofrecerte tratamientos personalizados que nutren, revitalizan y embellecen.
                    Sumérgete en un oasis de tranquilidad y deja que nuestros expertos te guíen hacia el equilibrio interior y la belleza radiante que mereces''',
                'phrase':
                    'En Ekilibra, tu bienestar es nuestra prioridad absoluta.'
              });
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
              context.push(ShowInformationPage.name, extra: {
                'title': 'Políticas de privacidad',
                'subTitle': 'Subtitulo',
                'description':
                    'Aquí se mostrarán las políticas de privacidad, Aquí se mostrarán las políticas de privacidad, Aquí se mostrarán las políticas de privacidad',
                'phrase': 'Frase'
              });
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
