import 'package:equatable/equatable.dart';

class LoginException extends Equatable implements Exception {
  final String message;
  const LoginException({this.message = ''});

  @override
  List<Object> get props => [message];
}
