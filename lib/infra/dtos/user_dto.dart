import 'dart:convert';
import 'package:pay_flow/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  final String idDto;
  final String nameDto;
  String? imageUrlDto;
  final String emailDto;

  UserDto({
    required this.idDto,
    required this.nameDto,
    this.imageUrlDto,
    required this.emailDto,
  }) : super(id: idDto, name: nameDto, imageUrl: imageUrlDto, email: emailDto);

  String get returnFirstNameOnly => nameDto.split(' ')[0];

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, imageUrl: $imageUrl, email: $email)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': idDto,
      'name': nameDto,
      'imageUrl': imageUrlDto,
      'email': emailDto,
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      idDto: map['id'],
      nameDto: map['name'],
      imageUrlDto: map['imageUrl'],
      emailDto: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDto.fromJson(String source) {
    return UserDto.fromMap(json.decode(source));
  }
}
