// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuoteImpl _$$QuoteImplFromJson(Map<String, dynamic> json) => _$QuoteImpl(
      place: json['place'] as String?,
      service: json['service'] == null
          ? null
          : Service.fromJson(json['service'] as Map<String, dynamic>),
      day: json['day'] as String?,
      hour: json['hour'] as String?,
      observation: json['observation'] as String?,
    );

Map<String, dynamic> _$$QuoteImplToJson(_$QuoteImpl instance) =>
    <String, dynamic>{
      'place': instance.place,
      'service': instance.service,
      'day': instance.day,
      'hour': instance.hour,
      'observation': instance.observation,
    };
