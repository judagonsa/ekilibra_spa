import 'dart:io';

import 'package:ekilibra_spa/app/config/helpers/banner_helper.dart';
import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/text_helpers.dart';
import 'package:ekilibra_spa/app/pages/profile/cubit/profile_cubit.dart';
import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';
import 'package:ekilibra_spa/app/pages/profile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.isRegister});

  final bool? isRegister;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isRegister ?? false ? 'Registro' : 'Mi perfil'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) =>
            _ProfileView(isRegister: isRegister ?? false),
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            child: _InputForm(isRegister: isRegister),
          ),
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
  final List<String> cities = ['Sogamoso', 'Duitama', 'Tunja'];

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerObservations = TextEditingController();

  var obscureTextPassword = true;
  var obscureTextConfirmPassword = true;

  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  File? image;
  bool isRealtime = false;

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.watch<ProfileCubit>();

    _controllerName.text = profileCubit.state.data?.userName ?? '';
    _controllerCity.text = profileCubit.state.data?.city ?? '';
    _controllerPhone.text = profileCubit.state.data?.phone ?? '';
    _controllerDate.text = profileCubit.state.data?.bithDate ?? '';
    _controllerObservations.text = profileCubit.state.data?.observation ?? '';

    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (!widget.isRegister)
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(80),
                  child: IconButton(
                    iconSize: 150,
                    icon: image == null
                        ? const Icon(
                            Icons.account_circle,
                          )
                        : ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(75),
                              child: Image.file(
                                image!,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                    onPressed: () => loadImageProfile(),
                  ),
                ),
              ),
            ),
          // if (widget.isRegister) const SizedBox(height: 50),
          if (widget.isRegister) const _TitleRegister(),
          CustomTextFormField(
            label: 'Nombre y apellido',
            textEditingController: _controllerName,
            onChanged: (value) {
              if (isRealtime) _formKey.currentState?.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El nombre y apellido es requerido.';
              }
              if (value.length < 6) return 'Más de 6 caracteres.';
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CustomTextFormField(
              label: 'Número de teléfono',
              textEditingController: _controllerPhone,
              isPhone: true,
              onChanged: (value) {
                if (isRealtime) _formKey.currentState?.validate();
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El número de teléfono es requerido.';
                }

                if (value.length != 10) {
                  return 'Número de teléfono inválido';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CustomTextFormField(
              textEditingController: _controllerDate,
              label: 'Fecha de nacimiento',
              onChanged: (value) async {
                if (profileCubit.state.data?.bithDate?.isNotEmpty == false) {
                  _controllerDate.text = '';
                  if (isRealtime) _formKey.currentState?.validate();
                }
                final date = await pickDate();
                if (date == null) return;
                setState(() {
                  _controllerDate.text =
                      '${date.day}/${date.month}/${date.year}';

                  if (isRealtime) _formKey.currentState?.validate();
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
                  if (isRealtime) _formKey.currentState?.validate();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selecciona la ciudad más cercana a tu ubicación',
                  style: TextStyle(fontSize: 13),
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  hint: const Text('Ciudad'),
                  onChanged: (value) {
                    if (value != null) _controllerCity.text = value;
                  },
                  value: _controllerCity.text,
                  items: cities.map(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  validator: (value) {
                    return value == null ? 'Favor seleccionar la ciudad' : null;
                  },
                ),
              ],
            ),
          ),
          if (widget.isRegister)
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CustomTextFormField(
                label: 'Contraseña',
                obscureText: obscureTextPassword,
                iconInput: Icon(
                  obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                ),
                iconActtion: () {
                  setState(() {
                    obscureTextPassword = !obscureTextPassword;
                  });
                },
                onChanged: (value) {
                  if (isRealtime) _formKey.currentState?.validate();
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
              padding: const EdgeInsets.only(top: 15),
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
                    obscureTextConfirmPassword = !obscureTextConfirmPassword;
                  });
                },
                onChanged: (value) {
                  if (isRealtime) _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Confirmar contraseña es requerido.';
                  }
                  if (profileCubit.state.data?.password != '' &&
                      value != profileCubit.state.data?.password) {
                    return 'las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Tooltip(
              key: tooltipkey,
              triggerMode: TooltipTriggerMode.manual,
              message:
                  'Acá podras agregar información que consideres pertinente, alguna enfermedad, alérgia o lesión a tener en cuenta.',
              child: CustomTextFormField(
                textEditingController: _controllerObservations,
                label: 'Observaciones a tener en cuenta',
                isObservation: true,
                iconInput: const Icon(Icons.question_mark_outlined),
                iconActtion: () {
                  tooltipkey.currentState?.ensureTooltipVisible();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: TextButton(
              onPressed: () {
                isRealtime = true;
                final isValid = _formKey.currentState!.validate();
                if (isValid) {
                  if (widget.isRegister) {
                    profileCubit.onSubmitRegister(Profile(
                      userName: _controllerName.text,
                      phone: _controllerPhone.text,
                      bithDate: _controllerDate.text,
                      city: _controllerCity.text,
                      observation: _controllerObservations.text,
                    ));
                  } else {
                    profileCubit.onSubmitUpdate(Profile(
                      userName: _controllerName.text,
                      phone: _controllerPhone.text,
                      bithDate: _controllerDate.text,
                      city: _controllerCity.text,
                      observation: _controllerObservations.text,
                    ));
                  }

                  if (profileCubit.state is SaveProfile) {
                    BannerHelper().showBanner(
                      context: context,
                      text: widget.isRegister
                          ? 'Perfil creado con exito.'
                          : 'Perfil guardado con exito.',
                    );
                  } else if (profileCubit.state is ErrorSaveProfile) {
                    BannerHelper().showBanner(
                      context: context,
                      text: widget.isRegister
                          ? 'Error creando perfil.'
                          : 'Error guardando perfil.',
                    );
                  }
                }
              },
              style: ButtonHelpers().primaryButton(isLogin: false),
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
          ),
          const SizedBox(height: 20),
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

  Future loadImageProfile() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    String phoneNumber = '';
    if (!widget.isRegister) {
      context.read<ProfileCubit>().getProfile(phoneNumber);
    }
  }
}

class _TitleRegister extends StatelessWidget {
  const _TitleRegister();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: Text(
        'Bienvenido a Ekilibra Spa',
        style: TextHelpers().textTitle(),
      ),
    );
  }
}
