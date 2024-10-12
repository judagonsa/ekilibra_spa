// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      title: json['title'] as String?,
      resumen: json['resumen'] as String?,
      duration: json['duration'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      observation: json['observation'] as String?,
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'resumen': instance.resumen,
      'duration': instance.duration,
      'images': instance.images,
      'observation': instance.observation,
    };
