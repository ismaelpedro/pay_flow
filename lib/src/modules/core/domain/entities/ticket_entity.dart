class TicketEntity {
  late String? id;
  final String name;
  final String date;
  final String code;
  final String value;
  late String? fkUser;

  TicketEntity({
    required this.name,
    required this.date,
    required this.code,
    required this.value,
    this.id,
    this.fkUser,
  });

  @override
  String toString() {
    return 'TicketEntity(id: $id, name: $name, date: $date, code: $code, value: $value, fkUser: $fkUser)';
  }
}
