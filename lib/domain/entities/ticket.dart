import 'package:equatable/equatable.dart';

class Ticket extends Equatable {
  final String? name;
  final String? date;
  final String? code;

  const Ticket({
    required this.name,
    required this.date,
    required this.code,
  });

  @override
  List<Object?> get props => [name, date, code];
}
