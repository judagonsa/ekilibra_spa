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

class _InputForm extends StatefulWidget {
  const _InputForm({required this.isRegister});

  final bool isRegister;

  @override
  State<_InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<_InputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String phone = '';
  String birthDay = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Column(
              children: [
                if (widget.isRegister) const FlutterLogo(size: 200),
                CustomTextFormField(
                  label: 'Nombre y apellido',
                  onChanged: (value) => name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre y apellido es requerido.';
                    }
                    if (value.length < 6) return 'Más de 6 caracteres.';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: 'Correo',
                  isEmail: true,
                  onChanged: (value) => email = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El correo es requerido.';
                    }

                    final emailRegExp = RegExp(
                      r'[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,64}',
                    );

                    if (!emailRegExp.hasMatch(value)) return 'Correo inválido';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: 'Número de teléfono',
                  isPhone: true,
                  onChanged: (value) => phone = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El número de teléfono es requerido.';
                    }

                    if (value.length != 10)
                      return 'Número de teléfono inválido';
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    label: 'Fecha de nacimiento',
                    onChanged: (value) => birthDay = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'La fecha de nacimiento es requerido.';
                      }
                      //TODO: validar mayor de 15 años, tipo date, seleccionable
                      return null;
                    }),
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: 'Contraseña',
                  obscureText: true,
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'La contraseña es requerida.';
                    }
                    final passwordRegExp = RegExp(
                      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*)[a-zA-Z]{6,}',
                    );

                    if (!passwordRegExp.hasMatch(value)) {
                      return 'Contraseña no segura, debe tener una mayúscula y una letra';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    label: 'Confirmar contraseña',
                    obscureText: true,
                    onChanged: (value) => confirmPassword = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirmar contraseña es requerido.';
                      }
                      if (value != password) {
                        return 'las contraseñas no coinciden';
                      }
                      return null;
                    }),
                const SizedBox(height: 10),
                FilledButton.tonalIcon(
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();
                    if (isValid) {
                      print("guardar modelo");
                    }
                  },
                  label: Text(
                    widget.isRegister ? 'Crear usuario' : 'Guardar',
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ],
        ));
  }
}
