import '../../domain/entities/user_entity.dart';

extension UserDto on UserEntity {
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'email': email,
    };
  }

  static UserEntity fromJson(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      email: map['email'],
    );
  }
}
