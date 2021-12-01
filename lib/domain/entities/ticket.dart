class Ticket {
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
  String toString() {
    return 'Ticket(id: $id, name: $name, date: $date, code: $code, fkUser: $fkUser)';
  }
}
