// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      userName: json['userName'] as String?,
      city: json['city'] as String?,
      bithDate: json['bithDate'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      observation: json['observation'] as String?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'city': instance.city,
      'bithDate': instance.bithDate,
      'phone': instance.phone,
      'password': instance.password,
      'observation': instance.observation,
    };
