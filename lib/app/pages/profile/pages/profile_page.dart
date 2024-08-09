import 'package:ekilibra_spa/app/config/helpers/buttonHelpers.dart';
import 'package:ekilibra_spa/app/pages/profile/bloc/cubit/profile_cubit.dart';
import 'package:ekilibra_spa/app/pages/profile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.isRegister});

  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isRegister ? 'Registro' : 'Mi perfil'),
      ),
      body: BlocProvider(
        create: (context) => ProfileCubit(),
        child: _ProfileView(isRegister: isRegister),
      ),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
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

  DateTime dateBirthDate = DateTime.now();

  final TextEditingController _controllerDate = TextEditingController();
  var obscureTextPassword = true;
  var obscureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.watch<ProfileCubit>();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(80),
                    child: const FlutterLogo(size: 80),
                  ),
                ),
              ),
              CustomTextFormField(
                label: 'Nombre y apellido',
                onChanged: (value) {
                  profileCubit.usernameChanged(value);
                  _formKey.currentState?.validate();
                },
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
                onChanged: (value) {
                  profileCubit.emailChanged(value);
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo es requerido.';
                  }

                  final emailRegExp = RegExp(
                    r'^[^@]+@[^@]+\.[a-zA-Z]{2,}$',
                  );

                  if (!emailRegExp.hasMatch(value)) return 'Correo inválido';
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                label: 'Número de teléfono',
                isPhone: true,
                onChanged: (value) {
                  profileCubit.phoneChanged(value);
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El número de teléfono es requerido.';
                  }

                  if (value.length != 10) return 'Número de teléfono inválido';
                  return null;
                },
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                textEditingController: _controllerDate,
                label: 'Fecha de nacimiento',
                onChanged: (value) async {
                  if (profileCubit.state.data.bithDate?.isNotEmpty == false) {
                    _controllerDate.text = '';
                    profileCubit.bithDateChanged(value);
                    _formKey.currentState?.validate();
                  }
                  final date = await pickDate();
                  if (date == null) return;
                  setState(() {
                    _controllerDate.text =
                        '${date.day}/${date.month}/${date.year}';

                    profileCubit.bithDateChanged(_controllerDate.text);
                    _formKey.currentState?.validate();
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La fecha de nacimiento es requerido.';
                  }
                  return null;
                },
                onTap: () async {
                  final date = await pickDate();
                  if (date == null) return;
                  setState(() {
                    _controllerDate.text =
                        '${date.day}/${date.month}/${date.year}';
                    profileCubit.bithDateChanged(_controllerDate.text);
                    _formKey.currentState?.validate();
                  });
                },
              ),
              if (widget.isRegister)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomTextFormField(
                    label: 'Contraseña',
                    obscureText: obscureTextPassword,
                    iconInput: Icon(
                      obscureTextPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    iconActtion: () {
                      setState(() {
                        obscureTextPassword = !obscureTextPassword;
                      });
                    },
                    onChanged: (value) {
                      profileCubit.passwordChanged(value);
                      _formKey.currentState?.validate();
                    },
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
                ),
              if (widget.isRegister)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomTextFormField(
                      label: 'Confirmar contraseña',
                      obscureText: obscureTextConfirmPassword,
                      iconInput: Icon(
                        obscureTextConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      iconActtion: () {
                        setState(() {
                          obscureTextConfirmPassword =
                              !obscureTextConfirmPassword;
                        });
                      },
                      onChanged: (value) {
                        profileCubit.verifyPasswords(value);
                        _formKey.currentState?.validate();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirmar contraseña es requerido.';
                        }
                        if (profileCubit.state.data.password != '' &&
                            value != profileCubit.state.data.password) {
                          return 'las contraseñas no coinciden';
                        }
                        return null;
                      }),
                ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    profileCubit.onSubmit();
                  }
                },
                // ignore: prefer_const_constructors
                style: ButtonHelpers().buttonAction(),
                child: SizedBox(
                  width: 200,
                  height: 40,
                  child: Center(
                    child: Text(
                      widget.isRegister ? 'Crear usuario' : 'Guardar',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ],
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        helpText: 'Debes ser mayor de 15 años.',
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year - 15),
      );
}
