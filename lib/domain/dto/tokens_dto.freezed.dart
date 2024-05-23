// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokens_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokensDto _$TokensDtoFromJson(Map<String, dynamic> json) {
  return _TokensDto.fromJson(json);
}

/// @nodoc
mixin _$TokensDto {
  String get access => throw _privateConstructorUsedError;
  String get refresh => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokensDtoCopyWith<TokensDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokensDtoCopyWith<$Res> {
  factory $TokensDtoCopyWith(TokensDto value, $Res Function(TokensDto) then) =
      _$TokensDtoCopyWithImpl<$Res, TokensDto>;
  @useResult
  $Res call({String access, String refresh});
}

/// @nodoc
class _$TokensDtoCopyWithImpl<$Res, $Val extends TokensDto>
    implements $TokensDtoCopyWith<$Res> {
  _$TokensDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_value.copyWith(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokensDtoImplCopyWith<$Res>
    implements $TokensDtoCopyWith<$Res> {
  factory _$$TokensDtoImplCopyWith(
          _$TokensDtoImpl value, $Res Function(_$TokensDtoImpl) then) =
      __$$TokensDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String access, String refresh});
}

/// @nodoc
class __$$TokensDtoImplCopyWithImpl<$Res>
    extends _$TokensDtoCopyWithImpl<$Res, _$TokensDtoImpl>
    implements _$$TokensDtoImplCopyWith<$Res> {
  __$$TokensDtoImplCopyWithImpl(
      _$TokensDtoImpl _value, $Res Function(_$TokensDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_$TokensDtoImpl(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokensDtoImpl implements _TokensDto {
  const _$TokensDtoImpl({required this.access, required this.refresh});

  factory _$TokensDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokensDtoImplFromJson(json);

  @override
  final String access;
  @override
  final String refresh;

  @override
  String toString() {
    return 'TokensDto(access: $access, refresh: $refresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokensDtoImpl &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.refresh, refresh) || other.refresh == refresh));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, access, refresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokensDtoImplCopyWith<_$TokensDtoImpl> get copyWith =>
      __$$TokensDtoImplCopyWithImpl<_$TokensDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokensDtoImplToJson(
      this,
    );
  }
}

abstract class _TokensDto implements TokensDto {
  const factory _TokensDto(
      {required final String access,
      required final String refresh}) = _$TokensDtoImpl;

  factory _TokensDto.fromJson(Map<String, dynamic> json) =
      _$TokensDtoImpl.fromJson;

  @override
  String get access;
  @override
  String get refresh;
  @override
  @JsonKey(ignore: true)
  _$$TokensDtoImplCopyWith<_$TokensDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
