class TicketEntity {
  final String id;
  final String name;
  final String date;
  final String code;
  final String fkUser;

  const TicketEntity({
    required this.id,
    required this.name,
    required this.date,
    required this.code,
    required this.fkUser,
  });
}
