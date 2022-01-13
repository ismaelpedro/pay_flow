class Ticket {
  final String? id;
  final String name;
  final String date;
  final String code;
  final double value;
  final String fkUser;

  const Ticket({
    this.id,
    required this.name,
    required this.date,
    required this.code,
    required this.value,
    required this.fkUser,
  });
}
