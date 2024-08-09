part of 'profile_cubit.dart';

class ProfileState {
  final DataProfile data;
  final bool loading = true;

  const ProfileState(this.data);
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial(super.data);
}

final class UpdateProfile extends ProfileState {
  const UpdateProfile(super.data);
}

final class VerifyPasswords extends ProfileState {
  final String confirmPassword;

  const VerifyPasswords(super.data, this.confirmPassword);
}

class DataProfile {
  final String? userName;
  final String? email;
  final String? bithDate;
  final String? phone;
  final String? password;
  final String? observation;

  DataProfile({
    this.userName,
    this.email,
    this.bithDate,
    this.phone,
    this.password,
    this.observation,
  });

  DataProfile copyWith(
      {String? userName,
      String? email,
      String? bithDate,
      String? phone,
      String? password,
      String? observation}) {
    return DataProfile(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        bithDate: bithDate ?? this.bithDate,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        observation: observation ?? this.observation);
  }
}
