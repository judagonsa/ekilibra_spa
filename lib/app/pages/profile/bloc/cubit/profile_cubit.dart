import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(super.initialState);

  usernameChanged(String value) {
    emit(UpdateProfile(state.data.copyWith(userName: value)));
  }

  emailChanged(String value) {
    emit(UpdateProfile(
      state.data.copyWith(userName: value),
    ));
  }

  bithDateChanged(String value) {
    emit(UpdateProfile(state.data.copyWith(bithDate: value)));
  }

  phoneChanged(String value) {
    emit(UpdateProfile(state.data.copyWith(phone: value)));
  }

  passwordChanged(String value) {
    emit(UpdateProfile(state.data.copyWith(password: value)));
  }

  onSubmit() {
    print(state);
  }
}
