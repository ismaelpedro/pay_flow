import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const UserDto._();

  factory UserDto({
    required String id,
    required String name,
    required String email,
    required String imageUrl,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  /// Convert [UserDto] to [UserEntity] entity
  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        email: email,
        imageUrl: imageUrl,
      );
}
