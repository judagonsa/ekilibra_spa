import 'dart:io';

import 'package:ekilibra_spa/app/config/helpers/banner_helper.dart';
import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/text_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/texts.dart';
import 'package:ekilibra_spa/app/pages/home/bloc/home_bloc.dart';
import 'package:ekilibra_spa/app/pages/profile/cubit/profile_cubit.dart';
import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';
import 'package:ekilibra_spa/app/pages/profile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatelessWidget {
  static const name = '/profile';
  const ProfilePage({super.key, required this.isRegister});

  final bool? isRegister;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _ImageProfile(
              isRegister: isRegister,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: _InputForm(isRegister: isRegister),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageProfile extends StatefulWidget {
  const _ImageProfile({required this.isRegister});
  final bool isRegister;

  @override
  State<_ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<_ImageProfile> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                top: (image != null && widget.isRegister == false) ? 0 : 70),
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
                      child:
                          Text(image == null ? 'Subir foto' : 'Cambiar foto'),
                    ),
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }

  Future loadImageProfile() async {
    try {
      final imageGalery =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageGalery == null) return;
      final imageTemp = File(imageGalery.path);
      setState(() => image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
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

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerObservations = TextEditingController();

  var obscureTextPassword = true;
  var obscureTextConfirmPassword = true;

  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  bool isRealtime = false;

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.watch<ProfileCubit>();
    final List<String>? cities = context.read<HomeBloc>().state.places;

    _controllerName.text = profileCubit.state.data?.userName ?? '';
    _controllerCity.text = profileCubit.state.data?.city ?? '';
    _controllerPhone.text = profileCubit.state.data?.phone ?? '';
    _controllerDate.text = profileCubit.state.data?.bithDate ?? '';
    _controllerObservations.text = profileCubit.state.data?.observation ?? '';

    return Form(
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
              if (value.length < 6) return 'Más de 6 caracteres.';
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
                if (isRealtime) _formKey.currentState?.validate();
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
                Text(
                  Texts.placeNearYouLocation,
                  style: const TextStyle(fontSize: 13),
                ),
                if (cities != null)
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
                    hint: Text(Texts.city),
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
                      return value == null ? Texts.pleaseSelectCity : null;
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
                    obscureTextConfirmPassword = !obscureTextConfirmPassword;
                  });
                },
                onChanged: (value) {
                  if (isRealtime) _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Texts.confirmPasswordRequired;
                  }
                  if (profileCubit.state.data?.password != '' &&
                      value != profileCubit.state.data?.password) {
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
                          ? Texts.profileCreateSuccess
                          : Texts.profileSaveSuccess,
                    );
                  } else if (profileCubit.state is ErrorSaveProfile) {
                    BannerHelper().showBanner(
                      context: context,
                      text: widget.isRegister
                          ? Texts.profileCreateError
                          : Texts.profileSaveError,
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
                    widget.isRegister ? Texts.createProfile : Texts.save,
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
        helpText: Texts.fifteenYearsOld,
        firstDate: DateTime(1900),
        lastDate: DateTime(DateTime.now().year - 15),
      );

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
