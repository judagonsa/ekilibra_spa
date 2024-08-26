part of 'login_cubit.dart';

class LoginState {
  const LoginState(this.data);
  final Data data;
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

class Data {
  final String numberPhone;
  final String password;

  Data({required this.numberPhone, required this.password});

  Data copyWith({String? numberPhone, String? password}) {
    return Data(
      numberPhone: numberPhone ?? this.numberPhone,
      password: password ?? this.password,
    );
  }
}
