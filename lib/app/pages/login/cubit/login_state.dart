part of 'login_cubit.dart';

@freezed
class LoginState {
  final String numberPhone;
  final String password;

  LoginState({required this.numberPhone, required this.password});
}

class ErrorState {}

class SuccessState {}
