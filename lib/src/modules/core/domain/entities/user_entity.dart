// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserEntity {
  final String id;
  final String name;
  final String email;
  String? imageUrl;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.imageUrl,
  });

  String get firstName => name.split(' ')[0];

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, imageUrl: $imageUrl, email: $email)';
  }

  @override
  bool operator ==(covariant UserEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ imageUrl.hashCode;
  }

  UserEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? imageUrl,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
