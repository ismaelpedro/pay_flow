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

  String get firstNameOnly => name.split(' ')[0];

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, imageUrl: $imageUrl, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.id == id &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ imageUrl.hashCode ^ email.hashCode;
  }
}
