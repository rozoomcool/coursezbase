import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {

  const factory UserDto({
    required String username,
    @Default("") String? email,
    required String password,
}) = _UserDto;

  factory UserDto.fromJson(Map<String, Object?> json)
  => _$UserDtoFromJson(json);
}