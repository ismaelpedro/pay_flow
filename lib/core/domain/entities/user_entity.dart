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
}
