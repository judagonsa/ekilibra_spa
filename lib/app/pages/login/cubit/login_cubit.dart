import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState(Data(numberPhone: '', password: '')));

  onSubmit() async {}
}
