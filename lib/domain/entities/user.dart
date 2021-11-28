import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String? imageUrl;
  final String email;
  final String password;

  const User({
    required this.name,
    this.imageUrl,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, imageUrl, email, password];
}
