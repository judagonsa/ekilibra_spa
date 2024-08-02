import 'package:ekilibra_spa/app/pages/profile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.isRegister});

  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isRegister ? 'Registro' : 'Mi perfil'),
      ),
      body: _ProfileView(isRegister: isRegister),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({required this.isRegister});

  final bool isRegister;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: _InputForm(isRegister: isRegister),
        ),
      ),
    );
  }
}

class _InputForm extends StatelessWidget {
  const _InputForm({required this.isRegister});

  final bool isRegister;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Column(
          children: [
            if (isRegister) const FlutterLogo(size: 200),
            CustomTextFormField(
              label: 'Nombre y apellido',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Correo',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Fecha de nacimiento',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Contrseña',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              label: 'Confirmar contraseña',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            FilledButton.tonalIcon(
                onPressed: () {},
                label: Text(isRegister ? 'Crear usuario' : 'Guardar')),
            const SizedBox(height: 20)
          ],
        ),
      ],
    ));
  }
}
