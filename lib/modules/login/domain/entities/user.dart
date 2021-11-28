class User {
  final String id;
  final String name;
  final String? imageUrl;
  final String email;
  final String? password;

  const User({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.email,
    this.password,
  });
}
