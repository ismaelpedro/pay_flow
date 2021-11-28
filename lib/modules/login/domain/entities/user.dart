import 'package:equatable/equatable.dart';

class User extends Equatable {
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

  @override
  List<Object?> get props => [id, name, imageUrl, email, password];
}
