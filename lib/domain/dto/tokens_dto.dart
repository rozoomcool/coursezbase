import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokens_dto.freezed.dart';
part 'tokens_dto.g.dart';

@freezed
class TokensDto with _$TokensDto {

  const factory TokensDto({
    required String access,
    required String refresh,
  }) = _TokensDto;

  factory TokensDto.fromJson(Map<String, Object?> json)
  => _$TokensDtoFromJson(json);
}