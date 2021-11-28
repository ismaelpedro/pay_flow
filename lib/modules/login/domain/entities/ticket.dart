import 'package:equatable/equatable.dart';

class Ticket extends Equatable {
  final String id;
  final String name;
  final String date;
  final String code;
  final String fkUser;

  const Ticket({
    required this.id,
    required this.name,
    required this.date,
    required this.code,
    required this.fkUser,
  });

  @override
  List<Object?> get props => [id, name, date, code, fkUser];
}
