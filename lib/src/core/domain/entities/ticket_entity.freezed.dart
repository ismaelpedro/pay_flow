// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TicketEntity {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;
  String? get fkUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketEntityCopyWith<TicketEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketEntityCopyWith<$Res> {
  factory $TicketEntityCopyWith(
          TicketEntity value, $Res Function(TicketEntity) then) =
      _$TicketEntityCopyWithImpl<$Res, TicketEntity>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? date,
      String? code,
      double? value,
      String? fkUser});
}

/// @nodoc
class _$TicketEntityCopyWithImpl<$Res, $Val extends TicketEntity>
    implements $TicketEntityCopyWith<$Res> {
  _$TicketEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? date = freezed,
    Object? code = freezed,
    Object? value = freezed,
    Object? fkUser = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      fkUser: freezed == fkUser
          ? _value.fkUser
          : fkUser // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketEntityImplCopyWith<$Res>
    implements $TicketEntityCopyWith<$Res> {
  factory _$$TicketEntityImplCopyWith(
          _$TicketEntityImpl value, $Res Function(_$TicketEntityImpl) then) =
      __$$TicketEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? date,
      String? code,
      double? value,
      String? fkUser});
}

/// @nodoc
class __$$TicketEntityImplCopyWithImpl<$Res>
    extends _$TicketEntityCopyWithImpl<$Res, _$TicketEntityImpl>
    implements _$$TicketEntityImplCopyWith<$Res> {
  __$$TicketEntityImplCopyWithImpl(
      _$TicketEntityImpl _value, $Res Function(_$TicketEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? date = freezed,
    Object? code = freezed,
    Object? value = freezed,
    Object? fkUser = freezed,
  }) {
    return _then(_$TicketEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      fkUser: freezed == fkUser
          ? _value.fkUser
          : fkUser // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TicketEntityImpl implements _TicketEntity {
  _$TicketEntityImpl(
      {this.id, this.name, this.date, this.code, this.value, this.fkUser});

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? date;
  @override
  final String? code;
  @override
  final double? value;
  @override
  final String? fkUser;

  @override
  String toString() {
    return 'TicketEntity(id: $id, name: $name, date: $date, code: $code, value: $value, fkUser: $fkUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.fkUser, fkUser) || other.fkUser == fkUser));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, date, code, value, fkUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketEntityImplCopyWith<_$TicketEntityImpl> get copyWith =>
      __$$TicketEntityImplCopyWithImpl<_$TicketEntityImpl>(this, _$identity);
}

abstract class _TicketEntity implements TicketEntity {
  factory _TicketEntity(
      {final String? id,
      final String? name,
      final String? date,
      final String? code,
      final double? value,
      final String? fkUser}) = _$TicketEntityImpl;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get date;
  @override
  String? get code;
  @override
  double? get value;
  @override
  String? get fkUser;
  @override
  @JsonKey(ignore: true)
  _$$TicketEntityImplCopyWith<_$TicketEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
