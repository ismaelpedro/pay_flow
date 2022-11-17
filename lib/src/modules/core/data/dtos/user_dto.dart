import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core.dart';
part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  factory UserDto({
    required String id,
    required String name,
    required String email,
    required String imageUrl,
  }) = _UserDto;
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      imageUrl: imageUrl,
    );
  }
}
