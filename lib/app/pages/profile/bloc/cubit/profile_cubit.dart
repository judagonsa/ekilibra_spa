import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial(DataProfile()));

  usernameChanged(String value) {
    emit(UpdateProfile(state.data.copyWith(userName: value)));
  }

  emailChanged(String value) {
    emit(UpdateProfile(state.data.copyWith(email: value)));
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

  verifyPasswords(String value) {
    emit(VerifyPasswords(state.data, value));
  }

  changeObservation(String value) {
    emit(UpdateProfile(state.data.copyWith(observation: value)));
  }

  onSubmit() {
    print(state);
  }
}
