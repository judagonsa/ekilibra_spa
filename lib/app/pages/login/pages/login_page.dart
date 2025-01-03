import 'package:ekilibra_spa/app/config/exports/helpers/exports_helpers.dart';
import 'package:ekilibra_spa/app/pages/profile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const name = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
    bool isRealtime = false;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formLoginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CustomTextFormField(
                      label: Texts.phoneNumber,
                      // textEditingController: _controllerName,
                      onChanged: (value) {
                        // profileCubit.usernameChanged(value);
                        if (isRealtime) formLoginKey.currentState?.validate();
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
                      label: Texts.password,
                      // obscureText: obscureTextPassword,
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
                        // profileCubit.passwordChanged(value);
                        if (isRealtime) formLoginKey.currentState?.validate();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Texts.passwordRequired;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        isRealtime = true;
                        final isValid = formLoginKey.currentState!.validate();
                        if (isValid) {
                          // ignore: avoid_print
                          print('revisar datos on firebase');
                        }
                      },
                      style: ButtonHelpers().primaryButton(isLogin: true),
                      child: Text(
                        Texts.startSession,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
