import 'package:coursezbase/domain/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required User user,
    required String firstname,
    required String lastname,
    required DateTime dateOfBirth,
    required String phone,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json)
  => _$UserDataFromJson(json);
}