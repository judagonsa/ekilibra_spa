import 'package:ekilibra_spa/app/pages/login/usecases/login_user_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUserUseCase loginUseCase;
  LoginCubit(this.loginUseCase)
      : super(
          LoginState(
            Data(numberPhone: '', password: ''),
          ),
        );

  Future<void> loginUser() async {
    try {
      emit(LoadingLoginState(state.data));

      final resp = await loginUseCase.invoke(
        state.data.numberPhone,
        state.data.password,
      );

      resp.fold(
        (l) => emit(ErrorLoginState(state.data)),
        (r) => emit(SuccessLoginState(state.data)), //retornar data del perfil
      );
    } catch (e) {
      emit(ErrorLoginState(state.data));
    }
  }

  Future<void> registerUser() async {
    try {
      emit(LoadingLoginState(state.data));

      final resp = await loginUseCase.invoke(
        state.data.numberPhone,
        state.data.password,
      );

      resp.fold(
        (l) => emit(ErrorLoginState(state.data)),
        (r) =>
            emit(SuccessLoginState(state.data)), //dirijir ala vitsa del login
      );
    } catch (e) {
      emit(ErrorLoginState(state.data));
    }
  }
}
