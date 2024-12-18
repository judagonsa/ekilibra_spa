import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';
import 'package:ekilibra_spa/app/pages/profile/usecases/profile_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileUseCases) : super(const ProfileInitial(Profile()));

  final ProfileUseCases profileUseCases;

  onRestartState() async {
    emit(ProfileInitial(state.data));
  }

  onSubmitRegister(Profile profile) async {
    try {
      final resp = await profileUseCases.registerProfileUseCase.invoke(profile);

      resp.fold(
        (l) => emit(ErrorSaveProfile(state.data, 'error guardando profile')),
        (r) => emit(SaveProfile(state.data)), //retornar data del perfil
      );
    } catch (e) {
      emit(ErrorSaveProfile(state.data, e.toString()));
    }
  }

  onSubmitUpdate(Profile profile) async {
    try {
      final resp = await profileUseCases.updateProfileUseCase.invoke(profile);

      resp.fold(
        (l) => emit(ErrorSaveProfile(state.data, 'error guardando profile')),
        (r) => emit(SaveProfile(state.data)), //retornar data del perfil
      );
    } catch (e) {
      emit(ErrorSaveProfile(state.data, e.toString()));
    }
  }

  getProfile() async {
    try {
      final resp = await profileUseCases.getProfileUseCase.invoke();

      resp.fold(
        (l) => emit(ErrorSaveProfile(state.data, 'error cargando profile')),
        (profile) => emit(GetProfile(profile)),
      );
    } catch (e) {
      emit(ErrorSaveProfile(state.data, e.toString()));
    }
  }
}
