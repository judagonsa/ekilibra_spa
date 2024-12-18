// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String? get imageProfile => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get bithDate => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get observation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String? imageProfile,
      String? userName,
      String? bithDate,
      String? phone,
      String? city,
      String? password,
      String? observation});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageProfile = freezed,
    Object? userName = freezed,
    Object? bithDate = freezed,
    Object? phone = freezed,
    Object? city = freezed,
    Object? password = freezed,
    Object? observation = freezed,
  }) {
    return _then(_value.copyWith(
      imageProfile: freezed == imageProfile
          ? _value.imageProfile
          : imageProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      bithDate: freezed == bithDate
          ? _value.bithDate
          : bithDate // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      observation: freezed == observation
          ? _value.observation
          : observation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? imageProfile,
      String? userName,
      String? bithDate,
      String? phone,
      String? city,
      String? password,
      String? observation});
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageProfile = freezed,
    Object? userName = freezed,
    Object? bithDate = freezed,
    Object? phone = freezed,
    Object? city = freezed,
    Object? password = freezed,
    Object? observation = freezed,
  }) {
    return _then(_$ProfileImpl(
      imageProfile: freezed == imageProfile
          ? _value.imageProfile
          : imageProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      bithDate: freezed == bithDate
          ? _value.bithDate
          : bithDate // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      observation: freezed == observation
          ? _value.observation
          : observation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl with DiagnosticableTreeMixin implements _Profile {
  const _$ProfileImpl(
      {this.imageProfile,
      this.userName,
      this.bithDate,
      this.phone,
      this.city,
      this.password,
      this.observation});

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final String? imageProfile;
  @override
  final String? userName;
  @override
  final String? bithDate;
  @override
  final String? phone;
  @override
  final String? city;
  @override
  final String? password;
  @override
  final String? observation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Profile(imageProfile: $imageProfile, userName: $userName, bithDate: $bithDate, phone: $phone, city: $city, password: $password, observation: $observation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Profile'))
      ..add(DiagnosticsProperty('imageProfile', imageProfile))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('bithDate', bithDate))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('observation', observation));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.imageProfile, imageProfile) ||
                other.imageProfile == imageProfile) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.bithDate, bithDate) ||
                other.bithDate == bithDate) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.observation, observation) ||
                other.observation == observation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageProfile, userName, bithDate,
      phone, city, password, observation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {final String? imageProfile,
      final String? userName,
      final String? bithDate,
      final String? phone,
      final String? city,
      final String? password,
      final String? observation}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String? get imageProfile;
  @override
  String? get userName;
  @override
  String? get bithDate;
  @override
  String? get phone;
  @override
  String? get city;
  @override
  String? get password;
  @override
  String? get observation;
  @override
  @JsonKey(ignore: true)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
