// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_answers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionAnswerModelImpl _$$QuestionAnswerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$QuestionAnswerModelImpl(
      question: json['question'] as String?,
      answer: json['answer'] as String?,
      enable: json['enable'] as String?,
    );

Map<String, dynamic> _$$QuestionAnswerModelImplToJson(
        _$QuestionAnswerModelImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
      'enable': instance.enable,
    };
