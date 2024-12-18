part of 'profile_cubit.dart';

class ProfileState {
  final Profile? data;

  const ProfileState(this.data);
}

class Initial extends ProfileState {
  const Initial(super.data);
}

class ProfileInitial extends ProfileState {
  const ProfileInitial(super.data);
}

class SaveProfile extends ProfileState {
  const SaveProfile(super.data);
}

class ErrorSaveProfile extends ProfileState {
  const ErrorSaveProfile(super.data, this.error);

  final String error;
}

class GetProfile extends ProfileState {
  const GetProfile(super.data);
}
