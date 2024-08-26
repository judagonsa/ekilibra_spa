import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';
import 'package:ekilibra_spa/app/pages/profile/usecases/profile_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileUseCases) : super(const ProfileInitial(Profile()));

  final ProfileUseCases profileUseCases;

  usernameChanged(String value) {
    emit(UpdateProfile(state.data?.copyWith(userName: value)));
  }

  emailChanged(String value) {
    emit(UpdateProfile(state.data?.copyWith(email: value)));
  }

  bithDateChanged(String value) {
    emit(UpdateProfile(state.data?.copyWith(bithDate: value)));
  }

  phoneChanged(String value) {
    emit(UpdateProfile(state.data?.copyWith(phone: value)));
  }

  passwordChanged(String value) {
    emit(UpdateProfile(state.data?.copyWith(password: value)));
  }

  changeObservation(String value) {
    emit(UpdateProfile(state.data?.copyWith(observation: value)));
  }

  onSubmitRegister() async {
    try {
      emit(LoadingSaveProfile(state.data));

      final resp = await profileUseCases.registerProfileUseCase.invoke(Profile(
          userName: state.data?.userName,
          email: state.data?.email,
          bithDate: state.data?.bithDate,
          phone: state.data?.phone,
          password: state.data?.password,
          observation: state.data?.observation));

      resp.fold(
        (l) => emit(ErrorSaveProfile(state.data, 'error guardando profile')),
        (r) => emit(SaveProfile(state.data)), //retornar data del perfil
      );
    } catch (e) {
      emit(ErrorSaveProfile(state.data, e.toString()));
    }
  }

  getProfile(String phoneNumber) async {
    try {
      emit(LoadingSaveProfile(state.data));

      final resp = await profileUseCases.getProfileUseCase.invoke(phoneNumber);

      resp.fold(
        (l) => emit(ErrorSaveProfile(state.data, 'error guardando profile')),
        (profile) => emit(GetProfile(profile)),
      );
    } catch (e) {
      emit(ErrorSaveProfile(state.data, e.toString()));
    }
  }
}
