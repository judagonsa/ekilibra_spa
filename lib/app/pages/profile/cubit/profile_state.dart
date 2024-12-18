part of 'profile_cubit.dart';

class ProfileState {
  final Profile? data;

  const ProfileState(this.data);
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial(super.data);
}

final class SaveProfile extends ProfileState {
  const SaveProfile(super.data);
}

final class ErrorSaveProfile extends ProfileState {
  const ErrorSaveProfile(super.data, this.error);

  final String error;
}

final class GetProfile extends ProfileState {
  const GetProfile(super.data);
}
