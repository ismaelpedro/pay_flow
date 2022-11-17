import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  factory UserEntity({
    required String id,
    required String name,
    required String email,
    required String imageUrl,
  }) = _UserEntity;

}
