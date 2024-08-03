part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final DataProfile data;
  final bool loading = true;

  const ProfileState(this.data);

  @override
  List<Object> get props => [DataProfile];
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial(super.data);
}

final class UpdateProfile extends ProfileState {
  const UpdateProfile(super.data);
}

class DataProfile {
  final String userName;
  final String email;
  final String bithDate;
  final String phone;
  final String password;

  DataProfile({
    this.userName = '',
    this.email = '',
    this.bithDate = '',
    this.phone = '',
    this.password = '',
  });

  DataProfile copyWith({
    String? userName,
    String? email,
    String? bithDate,
    String? phone,
    String? password,
  }) =>
      DataProfile(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        bithDate: bithDate ?? this.bithDate,
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );
}
