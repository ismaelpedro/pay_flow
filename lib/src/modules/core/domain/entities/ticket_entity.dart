class TicketEntity {
  final String? id;
  final String? name;
  final String date;
  final String code;
  final double value;
  String? fkUser;

  TicketEntity({
    this.id,
    this.name,
    required this.date,
    required this.code,
    required this.value,
    this.fkUser,
  });

  @override
  String toString() {
    return 'TicketEntity(id: $id, name: $name, date: $date, code: $code, value: $value, fkUser: $fkUser)';
  }
}
