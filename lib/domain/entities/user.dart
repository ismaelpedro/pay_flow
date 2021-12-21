class User {
  final String id;
  final String name;
  String? imageUrl;
  final String email;

  User({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.email,
  });

  String get firstNameOnly => name.split(' ')[0];
}
