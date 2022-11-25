// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticket_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) {
  return _TicketDto.fromJson(json);
}

/// @nodoc
mixin _$TicketDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get fkUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketDtoCopyWith<TicketDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketDtoCopyWith<$Res> {
  factory $TicketDtoCopyWith(TicketDto value, $Res Function(TicketDto) then) =
      _$TicketDtoCopyWithImpl<$Res, TicketDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String date,
      String code,
      String value,
      String fkUser});
}

/// @nodoc
class _$TicketDtoCopyWithImpl<$Res, $Val extends TicketDto>
    implements $TicketDtoCopyWith<$Res> {
  _$TicketDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? code = null,
    Object? value = null,
    Object? fkUser = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      fkUser: null == fkUser
          ? _value.fkUser
          : fkUser // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TicketDtoCopyWith<$Res> implements $TicketDtoCopyWith<$Res> {
  factory _$$_TicketDtoCopyWith(
          _$_TicketDto value, $Res Function(_$_TicketDto) then) =
      __$$_TicketDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String date,
      String code,
      String value,
      String fkUser});
}

/// @nodoc
class __$$_TicketDtoCopyWithImpl<$Res>
    extends _$TicketDtoCopyWithImpl<$Res, _$_TicketDto>
    implements _$$_TicketDtoCopyWith<$Res> {
  __$$_TicketDtoCopyWithImpl(
      _$_TicketDto _value, $Res Function(_$_TicketDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? date = null,
    Object? code = null,
    Object? value = null,
    Object? fkUser = null,
  }) {
    return _then(_$_TicketDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      fkUser: null == fkUser
          ? _value.fkUser
          : fkUser // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TicketDto extends _TicketDto {
  _$_TicketDto(
      {required this.id,
      required this.name,
      required this.date,
      required this.code,
      required this.value,
      required this.fkUser})
      : super._();

  factory _$_TicketDto.fromJson(Map<String, dynamic> json) =>
      _$$_TicketDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String date;
  @override
  final String code;
  @override
  final String value;
  @override
  final String fkUser;

  @override
  String toString() {
    return 'TicketDto(id: $id, name: $name, date: $date, code: $code, value: $value, fkUser: $fkUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TicketDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.fkUser, fkUser) || other.fkUser == fkUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, date, code, value, fkUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TicketDtoCopyWith<_$_TicketDto> get copyWith =>
      __$$_TicketDtoCopyWithImpl<_$_TicketDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketDtoToJson(
      this,
    );
  }
}

abstract class _TicketDto extends TicketDto {
  factory _TicketDto(
      {required final String id,
      required final String name,
      required final String date,
      required final String code,
      required final String value,
      required final String fkUser}) = _$_TicketDto;
  _TicketDto._() : super._();

  factory _TicketDto.fromJson(Map<String, dynamic> json) =
      _$_TicketDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get date;
  @override
  String get code;
  @override
  String get value;
  @override
  String get fkUser;
  @override
  @JsonKey(ignore: true)
  _$$_TicketDtoCopyWith<_$_TicketDto> get copyWith =>
      throw _privateConstructorUsedError;
}
