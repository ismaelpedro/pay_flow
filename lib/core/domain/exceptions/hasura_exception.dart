import 'package:equatable/equatable.dart';

class HasuraException extends Equatable implements Exception {
  final String message;
  const HasuraException({this.message = ''});

  @override
  List<Object> get props => [message];
}
