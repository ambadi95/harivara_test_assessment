
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_to_highlight.freezed.dart';

@freezed
class FieldToHighlight with _$FieldToHighlight {
  const factory FieldToHighlight.title() = _TitleHighlight;
  const factory FieldToHighlight.subtitle() = _SubTitleHighlight;
}
