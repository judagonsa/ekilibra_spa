part of 'login_cubit.dart';

class LoginState {
  const LoginState(this.data);
  final DataLogin data;
}

class ErrorLoginState extends LoginState {
  ErrorLoginState(super.data);
}

class LoadingLoginState extends LoginState {
  LoadingLoginState(super.data);
}

class SuccessLoginState extends LoginState {
  SuccessLoginState(super.data);
}

class DataLogin {
  final String numberPhone;
  final String password;

  DataLogin({required this.numberPhone, required this.password});

  DataLogin copyWith({String? numberPhone, String? password}) {
    return DataLogin(
      numberPhone: numberPhone ?? this.numberPhone,
      password: password ?? this.password,
    );
  }
}
