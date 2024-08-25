import 'dart:convert';

import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';
import 'package:ekilibra_spa/app/pages/profile/usecases/profile_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  onSubmit() async {
    if (await saveProfile(state.data)) {
      emit(SaveProfile(state.data));
    } else {
      emit(ErrorSaveProfile(state.data, 'Error guardando datos'));
    }
  }

  onStartProfile() async {
    final Profile? profile = await getProfile();
    if (profile != null) {
      emit(GetProfile(profile));
    }
  }

  Future<bool> saveProfile(Profile? profile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (profile != null) {
      final profileString = json.encode(profile);
      await prefs.setString('profile', profileString);
      return true;
    }
    return false;
  }

  Future<Profile?> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? profileString = prefs.getString('profile');
    if (profileString != null) {
      final data = json.decode(profileString);
      return Profile.fromJson(data);
    }
    return null;
  }
}
