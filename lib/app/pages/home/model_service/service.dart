import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    String? title,
    String? resumen,
    String? duration,
    List<String>? images,
    String? observation,
  }) = _Service;

  factory Service.fromJson(Map<String, Object?> json) =>
      _$ServiceFromJson(json);
}
