import 'dart:io';
import 'package:ekilibra_spa/app/config/exports/blocs/exports_blocs_cubits.dart';
import 'package:ekilibra_spa/app/config/exports/helpers/exports_helpers.dart';
import 'package:ekilibra_spa/app/pages/pages.dart';
import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';
import 'package:ekilibra_spa/app/pages/profile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  static const name = '/profile';
  const ProfilePage({
    super.key,
    required this.isRegister,
  });

  final bool isRegister;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return _ProfileView(isRegister: widget.isRegister);
  }
}

class _ProfileView extends StatefulWidget {
  const _ProfileView({required this.isRegister});

  final bool isRegister;

  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  late ProfileCubit profileCubit = context.read<ProfileCubit>();

  late List<String>? cities = context.read<HomeBloc>().state.places;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime dateBirthDate = DateTime.now();

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerObservations = TextEditingController();

  var obscureTextPassword = true;
  var obscureTextConfirmPassword = true;

  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  bool isRealtime = false;

  File? image;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is SaveProfile) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            PopupHelpers().popupTwoButtons(
              context: context,
              withIconClose: false,
              title: widget.isRegister ? 'Bienvenido' : 'Actualizado',
              description: widget.isRegister
                  ? 'Usuario creado con exito'
                  : 'Usuario actualizado con exito',
              icon: Icons.check_circle,
              titleButtonOne: "Aceptar",
              height: 140,
              onPressedOne: () {
                profileCubit.onRestartState();
                context.go(widget.isRegister ? LoginPage.name : HomePage.name);
              },
            );
          });
        } else if (state is ErrorSaveProfile) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            PopupHelpers().popupTwoButtons(
              context: context,
              withIconClose: true,
              title: 'Error',
              description: 'Descripción del error',
              icon: Icons.error,
              titleButtonOne: "Aceptar",
              height: 220,
            );
          });
        } else if (state is GetProfile) {
          if (profileCubit.state.data?.imageProfile != null) {
            image = File(profileCubit.state.data!.imageProfile!);
          }
          _controllerName.text = profileCubit.state.data?.userName ?? '';
          _controllerCity.text = profileCubit.state.data?.city ?? '';
          _controllerPhone.text = profileCubit.state.data?.phone ?? '';
          _controllerDate.text = profileCubit.state.data?.bithDate ?? '';
          _controllerObservations.text =
              profileCubit.state.data?.observation ?? '';
        }
        return Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      if (image != null && widget.isRegister == false)
                        Stack(
                          children: [
                            SizedBox(
                              height: 300,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                child: Image.file(
                                  image!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              top: 40,
                              child: CircleAvatar(
                                backgroundColor: Colors.white70,
                                child: IconButton(
                                  onPressed: () => context.pop(),
                                  icon: const Icon(
                                    Icons.arrow_back,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (widget.isRegister == false)
                        Padding(
                          padding: EdgeInsets.only(
                              top: (image != null && widget.isRegister == false)
                                  ? 0
                                  : 70),
                          child: SizedBox(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                if (image == null)
                                  Positioned(
                                    left: 10,
                                    child: IconButton(
                                      onPressed: () => context.pop(),
                                      icon: const Icon(Icons.arrow_back),
                                    ),
                                  ),
                                Center(
                                  child: TextButton(
                                    onPressed: () => loadImageProfile(),
                                    child: Text(image == null
                                        ? 'Subir foto'
                                        : 'Cambiar foto'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          if (widget.isRegister) const SizedBox(height: 50),
                          if (widget.isRegister) const _TitleRegister(),
                          CustomTextFormField(
                            label: Texts.nameAndLastname,
                            textEditingController: _controllerName,
                            onChanged: (value) {
                              if (isRealtime) _formKey.currentState?.validate();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return Texts.nameAndLastnameRequired;
                              }
                              if (value.length < 6) {
                                return 'Más de 6 caracteres.';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CustomTextFormField(
                              label: Texts.phoneNumber,
                              textEditingController: _controllerPhone,
                              isPhone: true,
                              onChanged: (value) {
                                if (isRealtime) {
                                  _formKey.currentState?.validate();
                                }
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return Texts.phoneNumberRequired;
                                }

                                if (value.length != 10) {
                                  return Texts.phoneNumberError;
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CustomTextFormField(
                              textEditingController: _controllerDate,
                              label: Texts.birthDate,
                              onChanged: (value) async {
                                if (profileCubit
                                        .state.data?.bithDate?.isNotEmpty ==
                                    false) {
                                  _controllerDate.text = '';
                                  if (isRealtime) {
                                    _formKey.currentState?.validate();
                                  }
                                }
                                final date = await pickDate();
                                if (date == null) return;
                                setState(() {
                                  _controllerDate.text =
                                      '${date.day}/${date.month}/${date.year}';

                                  if (isRealtime) {
                                    _formKey.currentState?.validate();
                                  }
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return Texts.birthDateRequired;
                                }
                                return null;
                              },
                              onTap: () async {
                                final date = await pickDate();
                                if (date == null) return;
                                setState(() {
                                  _controllerDate.text =
                                      '${date.day}/${date.month}/${date.year}';
                                  if (isRealtime) {
                                    _formKey.currentState?.validate();
                                  }
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Texts.placeNearYouLocation,
                                  style: const TextStyle(fontSize: 13),
                                ),
                                if (cities != null)
                                  DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          ),
                                        )),
                                    hint: Text(Texts.city),
                                    onChanged: (value) {
                                      if (value != null) {
                                        _controllerCity.text = value;
                                      }
                                    },
                                    value: _controllerCity.text.isEmpty
                                        ? null
                                        : _controllerCity.text,
                                    items: cities?.map(
                                      (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      },
                                    ).toList(),
                                    validator: (value) {
                                      return value == null
                                          ? Texts.pleaseSelectCity
                                          : null;
                                    },
                                  ),
                              ],
                            ),
                          ),
                          if (widget.isRegister)
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: CustomTextFormField(
                                label: Texts.password,
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
                                  _controllerPassword.text = value;
                                  if (isRealtime) {
                                    _formKey.currentState?.validate();
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return Texts.passwordRequired;
                                  }
                                  final passwordRegExp = RegExp(
                                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*)[a-zA-Z]{6,}',
                                  );

                                  if (!passwordRegExp.hasMatch(value)) {
                                    return Texts.passwordNotSecure;
                                  }
                                  return null;
                                },
                                textEditingController: _controllerPassword,
                              ),
                            ),
                          if (widget.isRegister)
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: CustomTextFormField(
                                label: Texts.confirmPassword,
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
                                  if (isRealtime) {
                                    _formKey.currentState?.validate();
                                  }
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return Texts.confirmPasswordRequired;
                                  }
                                  if (_controllerPassword.text != '' &&
                                      value != _controllerPassword.text) {
                                    return Texts.passwordDifferent;
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
                              message: Texts.informationForProfile,
                              child: CustomTextFormField(
                                textEditingController: _controllerObservations,
                                label: Texts.observationConsiderer,
                                isObservation: true,
                                iconInput:
                                    const Icon(Icons.question_mark_outlined),
                                iconActtion: () {
                                  tooltipkey.currentState
                                      ?.ensureTooltipVisible();
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: TextButton(
                              onPressed: () {
                                isRealtime = true;
                                final isValid =
                                    _formKey.currentState!.validate();
                                if (isValid) {
                                  saveInformation(widget.isRegister);
                                }
                              },
                              style:
                                  ButtonHelpers().primaryButton(isLogin: false),
                              child: SizedBox(
                                width: 200,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    widget.isRegister
                                        ? Texts.createProfile
                                        : Texts.save,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    if (!widget.isRegister) {
      context.read<ProfileCubit>().getProfile();
    }
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        helpText: Texts.fifteenYearsOld,
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year - 15),
      );

  Future loadImageProfile() async {
    try {
      final imageGalery =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageGalery == null) return;
      final imageTemp = File(imageGalery.path);
      setState(() => image = imageTemp);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: $e');
    }
  }

  saveInformation(bool isRegister) {
    if (widget.isRegister) {
      profileCubit.onSubmitRegister(Profile(
        imageProfile: image?.path,
        userName: _controllerName.text,
        phone: _controllerPhone.text,
        bithDate: _controllerDate.text,
        city: _controllerCity.text,
        observation: _controllerObservations.text,
      ));
    } else {
      profileCubit.onSubmitUpdate(Profile(
        imageProfile: image?.path,
        userName: _controllerName.text,
        phone: _controllerPhone.text,
        bithDate: _controllerDate.text,
        city: _controllerCity.text,
        observation: _controllerObservations.text,
      ));
    }
  }
}

class _TitleRegister extends StatelessWidget {
  const _TitleRegister();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: -10,
              top: -5,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            Center(
              child: Text(
                Texts.welcomeEkilibra,
                style: TextHelpers().textTitle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
