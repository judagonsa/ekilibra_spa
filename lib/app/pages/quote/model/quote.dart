// This file is "main.dart"
import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'quote.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'quote.g.dart';

@freezed
class Quote with _$Quote {
  const Quote._();

  factory Quote({
    String? place,
    Service? service,
    String? day,
    String? hour,
    String? observation,
    bool? isEnable,
  }) = _Quote;

  factory Quote.fromJson(Map<String, Object?> json) => _$QuoteFromJson(json);
}
