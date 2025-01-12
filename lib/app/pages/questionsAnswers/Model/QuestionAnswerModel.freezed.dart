// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QuestionAnswerModel _$QuestionAnswerModelFromJson(Map<String, dynamic> json) {
  return _QuestionAnswerModel.fromJson(json);
}

/// @nodoc
mixin _$QuestionAnswerModel {
  String? get question => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;
  String? get enable => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionAnswerModelCopyWith<QuestionAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionAnswerModelCopyWith<$Res> {
  factory $QuestionAnswerModelCopyWith(
          QuestionAnswerModel value, $Res Function(QuestionAnswerModel) then) =
      _$QuestionAnswerModelCopyWithImpl<$Res, QuestionAnswerModel>;
  @useResult
  $Res call({String? question, String? answer, String? enable});
}

/// @nodoc
class _$QuestionAnswerModelCopyWithImpl<$Res, $Val extends QuestionAnswerModel>
    implements $QuestionAnswerModelCopyWith<$Res> {
  _$QuestionAnswerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = freezed,
    Object? answer = freezed,
    Object? enable = freezed,
  }) {
    return _then(_value.copyWith(
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      enable: freezed == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionAnswerModelImplCopyWith<$Res>
    implements $QuestionAnswerModelCopyWith<$Res> {
  factory _$$QuestionAnswerModelImplCopyWith(_$QuestionAnswerModelImpl value,
          $Res Function(_$QuestionAnswerModelImpl) then) =
      __$$QuestionAnswerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? question, String? answer, String? enable});
}

/// @nodoc
class __$$QuestionAnswerModelImplCopyWithImpl<$Res>
    extends _$QuestionAnswerModelCopyWithImpl<$Res, _$QuestionAnswerModelImpl>
    implements _$$QuestionAnswerModelImplCopyWith<$Res> {
  __$$QuestionAnswerModelImplCopyWithImpl(_$QuestionAnswerModelImpl _value,
      $Res Function(_$QuestionAnswerModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = freezed,
    Object? answer = freezed,
    Object? enable = freezed,
  }) {
    return _then(_$QuestionAnswerModelImpl(
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
      enable: freezed == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionAnswerModelImpl
    with DiagnosticableTreeMixin
    implements _QuestionAnswerModel {
  const _$QuestionAnswerModelImpl({this.question, this.answer, this.enable});

  factory _$QuestionAnswerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionAnswerModelImplFromJson(json);

  @override
  final String? question;
  @override
  final String? answer;
  @override
  final String? enable;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionAnswerModel(question: $question, answer: $answer, enable: $enable)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionAnswerModel'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('answer', answer))
      ..add(DiagnosticsProperty('enable', enable));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionAnswerModelImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.enable, enable) || other.enable == enable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer, enable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionAnswerModelImplCopyWith<_$QuestionAnswerModelImpl> get copyWith =>
      __$$QuestionAnswerModelImplCopyWithImpl<_$QuestionAnswerModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionAnswerModelImplToJson(
      this,
    );
  }
}

abstract class _QuestionAnswerModel implements QuestionAnswerModel {
  const factory _QuestionAnswerModel(
      {final String? question,
      final String? answer,
      final String? enable}) = _$QuestionAnswerModelImpl;

  factory _QuestionAnswerModel.fromJson(Map<String, dynamic> json) =
      _$QuestionAnswerModelImpl.fromJson;

  @override
  String? get question;
  @override
  String? get answer;
  @override
  String? get enable;
  @override
  @JsonKey(ignore: true)
  _$$QuestionAnswerModelImplCopyWith<_$QuestionAnswerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
