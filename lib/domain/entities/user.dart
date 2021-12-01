class UserEntitie {
  final String id;
  final String name;
  String? imageUrl;
  final String email;

  UserEntitie({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.email,
  });

  @override
  String toString() {
    return 'UserEntitie(id: $id, name: $name, imageUrl: $imageUrl, email: $email)';
  }
}
