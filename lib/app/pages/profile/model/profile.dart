import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'profile.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    String? userName,
    String? bithDate,
    String? phone,
    String? city,
    String? password,
    String? observation,
  }) = _Profile;

  factory Profile.fromJson(Map<String, Object?> json) =>
      _$ProfileFromJson(json);
}
